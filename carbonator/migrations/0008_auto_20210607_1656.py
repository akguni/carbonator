# Generated by Django 3.1.6 on 2021-06-07 16:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carbonator', '0007_auto_20210517_1127'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cost',
            name='trees',
            field=models.DecimalField(decimal_places=4, max_digits=10),
        ),
    ]
