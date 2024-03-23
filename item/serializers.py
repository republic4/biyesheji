
from rest_framework import serializers

from item.models import xiangmu


class xiangmuSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = xiangmu
        fields = ['c11', 'name']
