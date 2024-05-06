from django.db import models

class login_table(models.Model):
    username=models.CharField(max_length=10)
    password=models.CharField(max_length=10)
    type=models.CharField(max_length=10)

class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=20)
    email=models.CharField(max_length=30)
    phone=models.BigIntegerField()

class complaint_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=5000)
    reply=models.CharField(max_length=5000)
    date=models.DateField()

class feedback_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=5000)
    date=models.DateField()

class prediction_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    image=models.FileField()
    date=models.DateField()
    errorlevel=models.CharField(max_length=50)
    result=models.CharField(max_length=50)




