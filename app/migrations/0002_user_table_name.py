# Generated by Django 3.2.25 on 2024-04-01 06:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user_table',
            name='name',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
    ]
