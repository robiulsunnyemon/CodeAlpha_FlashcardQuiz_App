# Generated by Django 5.1.5 on 2025-02-02 09:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tutor', '0002_categoryquestion'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Categoryquestion',
        ),
        migrations.RemoveField(
            model_name='question',
            name='user',
        ),
        migrations.DeleteModel(
            name='Choice',
        ),
        migrations.DeleteModel(
            name='Question',
        ),
    ]
