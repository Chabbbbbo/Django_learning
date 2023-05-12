from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name = "index"),
]
# 해당 path로 들어오면, views의 index를 excution하라는 것
# views.index는> 아까 만든 views에 있는 def index(request)를 실행하라는 것
