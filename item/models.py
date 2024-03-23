from datetime import datetime
from datetime import date
from django.db import models
from django.db.models import Avg
from django.db.models.fields.files import FileField
from itertools import chain


# 数据库表
class User(models.Model):
    username = models.CharField(max_length=255, unique=True, verbose_name="账号")  # unique唯一（不重复）
    password = models.CharField(max_length=255, verbose_name="密码")
    email = models.EmailField(verbose_name="邮箱")
    created_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "用户"
        verbose_name = "用户"

    def __str__(self):
        return self.username


class Tags(models.Model):
    name = models.CharField(max_length=255, verbose_name="标签", unique=True)

    class Meta:
        verbose_name = "标签"
        verbose_name_plural = "标签"

    def __str__(self):
        return self.name


class UserTagPrefer(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, blank=True, verbose_name="用户id",
    )
    tag = models.ForeignKey(Tags, on_delete=models.CASCADE, verbose_name='标签名')
    score = models.FloatField(default=0)

    class Meta:
        verbose_name = "用户偏好"
        verbose_name_plural = "偏好"

    def __str__(self):
        return self.user.username + str(self.score)



class xiangmu(models.Model):
    tags = models.ManyToManyField(Tags, verbose_name='标签', blank=True)  # 多对多关系
    collect = models.ManyToManyField(User, verbose_name="收藏者", blank=True)
    name = models.CharField(verbose_name="新能源汽车名称", max_length=255, unique=True)
    c2 = models.CharField(verbose_name="价格", max_length=255)
    c3 = models.CharField(verbose_name="地区", max_length=255)
    c4 = models.DateField(verbose_name='上架日期')
    c5 = models.CharField(verbose_name="新能源汽车评分", max_length=1024)
    c6 = models.IntegerField(verbose_name="评价数")
    c7 = models.CharField(verbose_name="新能源汽车评分", max_length=255)
    c8 = models.TextField(verbose_name="描述")
    c9 = models.IntegerField(verbose_name="新能源汽车浏览量", default=0)
    c10 = models.TextField(verbose_name="图片")
    c11 = models.TextField(verbose_name="图片")
    c12 = models.TextField(verbose_name="图片")

    @property
    def movie_rate(self):
        movie_rate = Rate.objects.filter(movie_id=self.id).aggregate(Avg('mark'))['mark__avg']
        return movie_rate or '无'

    class Meta:
        verbose_name = "新能源汽车"
        verbose_name_plural = "新能源汽车"

    def __str__(self):
        return self.name

    def to_dict(self, fields=None, exclude=None):
        opts = self._meta
        data = {}
        for f in chain(opts.concrete_fields, opts.private_fields, opts.many_to_many):
            if exclude and f.name in exclude:
                continue
            if fields and f.name not in fields:
                continue
            value = f.value_from_object(self)
            if isinstance(value, date):
                value = value.strftime('%Y-%m-%d')
            elif isinstance(f, FileField):
                value = value.url if value else None
            data[f.name] = value
        return data


# 用户对新能源汽车打分数据
class Rate(models.Model):
    movie = models.ForeignKey(
        xiangmu, on_delete=models.CASCADE, blank=True, null=True, verbose_name="新能源汽车id"
    )
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, blank=True, null=True, verbose_name="用户id",
    )
    mark = models.FloatField(verbose_name="新能源汽车评分")
    create_time = models.DateTimeField(verbose_name="发布时间", auto_now_add=True)

    @property
    def avg_mark(self):
        average = Rate.objects.all().aggregate(Avg('mark'))['mark__avg']  # 求平均分
        return average

    class Meta:
        verbose_name = "评分信息"
        verbose_name_plural = verbose_name


# 新能源汽车评论表
class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户")  # 外建关联
    content = models.CharField(max_length=255, verbose_name="内容")
    create_time = models.DateTimeField(auto_now_add=True)
    movie = models.ForeignKey(xiangmu, on_delete=models.CASCADE, verbose_name="新能源汽车")

    class Meta:
        verbose_name = "评论"
        verbose_name_plural = verbose_name


class LikeComment(models.Model):
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE, verbose_name='评论')
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')

    class Meta:
        verbose_name = "评论点赞"
        verbose_name_plural = verbose_name
