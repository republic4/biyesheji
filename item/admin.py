from django.apps import apps
from django.contrib import admin
from django.db.models import ManyToOneRel, ForeignKey, OneToOneField

from item.models import User, Tags, UserTagPrefer, xiangmu, Rate, Comment, LikeComment


class ListAdminMixin(object):
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        self.list_select_related = [x.name for x in model._meta.fields if isinstance(x, (ManyToOneRel, ForeignKey, OneToOneField,))]

        # self.search_fields=[model.p]
        super(ListAdminMixin, self).__init__(model, admin_site)

models = apps.get_models()
for model in models:
    # 判断model是不是咱们需要的 是的话去注册
    if model in [User,Tags, UserTagPrefer, xiangmu, Rate, Comment, LikeComment]:
        admin_class = type('AdminClass', (ListAdminMixin, admin.ModelAdmin), {})
        try:
            admin.site.register(model, admin_class)
            print(model)
        except admin.sites.AlreadyRegistered:
            pass

from django.contrib.auth.models import Group, User
# 注销group 和 user
admin.site.unregister(Group)
admin.site.unregister(User)