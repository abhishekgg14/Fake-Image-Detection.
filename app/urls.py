"""FakeImageDetection URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from app import views

urlpatterns = [
    path('',views.login,name='login'),
    path('login_code',views.login_code,name='login_code'),
    path('reg_code',views.reg_code,name='reg_code'),
    path('user_complaint_code',views.user_complaint_code,name='user_complaint_code'),
    path('feedback_code', views.feedback_code, name='feedback_code'),
    path('reply_code', views.reply_code, name='reply_code'),

    path('view_complaint',views.view_complaint,name='view_complaint'),
    path('view_feedback',views.view_feedback,name='view_feedback'),
    path('admin_home',views.admin_home,name='admin_home'),
    path('reply/<int:id>',views.reply,name='reply'),
    path('delete_complaint/<int:id>',views.delete_complaint,name='delete_complaint'),
    path('view_user',views.view_user,name='view_user'),
    path('user_all_complaint',views.user_all_complaint,name='user_all_complaint'),
    path('user_complaint',views.user_complaint,name='user_complaint'),
    path('feedback',views.feedback,name='feedback'),
    path('view_history',views.view_history,name='view_history'),
    path('user_home',views.user_home,name='user_home'),
    path('view_prediction',views.view_prediction,name='view_prediction'),
    path('signup',views.signup,name='signup'),
    path('login',views.login,name='login'),
    path('get_image',views.get_image,name='get_image')
]
