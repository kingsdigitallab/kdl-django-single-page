# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailbase', '0002_blogpost_featured'),
        ('resources', '0003_staffpage_staffpageattachment_staffpagerelatedlink'),
    ]

    operations = [
        migrations.CreateModel(
            name='SplashPage',
            fields=[
                ('baserichtextpage_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailbase.BaseRichTextPage')),
                ('mission_statement', wagtail.wagtailcore.fields.RichTextField()),
                ('contact', wagtail.wagtailcore.fields.RichTextField()),
                ('contact_map', models.TextField(help_text=b'HTML to display inline map', blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailbase.baserichtextpage',),
        ),
        migrations.CreateModel(
            name='SplashPageSnippet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sort_order', models.IntegerField(null=True, editable=False, blank=True)),
                ('title', models.CharField(max_length=256)),
                ('content', wagtail.wagtailcore.fields.RichTextField()),
                ('class_name', models.CharField(max_length=256, null=True, blank=True)),
                ('page', modelcluster.fields.ParentalKey(related_name='snippets', to='resources.SplashPage')),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
    ]
