from django.db import models
from django.shortcuts import render

from model_utils.models import TimeStampedModel

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager

from taggit.models import TaggedItemBase

from wagtail.contrib.wagtailroutablepage.models import route
from wagtail.wagtailadmin.edit_handlers import (
    FieldPanel, InlinePanel, MultiFieldPanel)
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailcore.models import Orderable
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailimages.models import Image

from wagtailbase.base import (
    AbstractRelatedLink, AbstractAttachment, BaseIndexPage, BaseRichTextPage)
from wagtailbase.models import HomePage


class SplashPage(BaseRichTextPage):
    mission_statement = RichTextField()
    contact = RichTextField()
    contact_map = models.TextField(
        blank=True, help_text='HTML to display inline map')

    search_name = 'Splash Page'
    subpage_types = ['wagtailbase.IndexPage', 'wagtailbase.RichTextPage',
                     'wagtailbase.BlogIndexPage', 'PortfolioIndexPage',
                     'StaffIndexPage']

    @property
    def staff(self):
        return StaffPage.objects.filter(live=True, path__startswith=self.path)


class SplashPageSnippet(Orderable):
    page = ParentalKey('resources.SplashPage', related_name='snippets')
    title = models.CharField(max_length=256)
    content = RichTextField()
    class_name = models.CharField(max_length=256, blank=True, null=True)


SplashPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('content', classname='full'),
    FieldPanel('mission_statement', classname='full'),
    InlinePanel(SplashPageSnippet, 'snippets', label='Snippets'),
    FieldPanel('contact', classname='full'),
    FieldPanel('contact_map', classname='full')
]

StaffPage.promote_panels = [
    MultiFieldPanel(BaseRichTextPage.promote_panels,
                    'Common page configuration'),
]


class PortfolioIndexPage(BaseIndexPage):
    search_name = 'Portfolio'

    subpage_types = ['ProjectPage']

    @route(r'^$')
    def serve_listing(self, request):
        """Returns all the project pages that are live, sorted by the date they
        were created."""
        projects = ProjectPage.objects.filter(
            live=True, path__startswith=self.path)

        return render(request, self.get_template(request),
                      {'self': self, 'projects': projects})

HomePage.register_subpage_type(PortfolioIndexPage)


class PortfolioIndexPageRelatedLink(Orderable, AbstractRelatedLink):
    page = ParentalKey('resources.PortfolioIndexPage',
                       related_name='related_links')


class PortfolioIndexPageAttachment(Orderable, AbstractAttachment):
    page = ParentalKey('resources.PortfolioIndexPage',
                       related_name='attachments')


PortfolioIndexPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('introduction', classname='full'),
    InlinePanel(PortfolioIndexPage, 'related_links', label='Related links'),
    InlinePanel(PortfolioIndexPage, 'attachments', label='Attachments')
]

PortfolioIndexPage.promote_panels = [
    MultiFieldPanel(BaseIndexPage.promote_panels,
                    'Common page configuration'),
]


class ProjectPageTag(TaggedItemBase):
    content_object = ParentalKey('resources.ProjectPage',
                                 related_name='tagged_items')


class ProjectPage(BaseRichTextPage, TimeStampedModel):
    tags = ClusterTaggableManager(through=ProjectPageTag, blank=True)

    subpage_types = []

    search_name = 'Project page'


class ProjectPageRelatedLink(Orderable, AbstractRelatedLink):
    page = ParentalKey('resources.ProjectPage', related_name='related_links')


class ProjectPageAttachment(Orderable, AbstractAttachment):
    page = ParentalKey('resources.ProjectPage', related_name='attachments')


ProjectPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('content', classname='full'),
    InlinePanel(ProjectPage, 'related_links', label='Related links'),
    InlinePanel(ProjectPage, 'attachments', label='Attachments')
]

ProjectPage.promote_panels = [
    FieldPanel('tags'),
    MultiFieldPanel(BaseRichTextPage.promote_panels,
                    'Common page configuration'),
]


class StaffIndexPage(BaseIndexPage):
    search_name = 'Staff'

    subpage_types = ['resources.StaffPage']

    @route(r'^$')
    def serve_listing(self, request):
        """Returns all the staff pages that are live, sorted by title."""
        staff = StaffPage.objects.filter(live=True, path__startswith=self.path)

        return render(request, self.get_template(request),
                      {'self': self, 'staff': staff})

HomePage.register_subpage_type(StaffIndexPage)


class StaffIndexPageRelatedLink(Orderable, AbstractRelatedLink):
    page = ParentalKey('resources.StaffIndexPage',
                       related_name='related_links')


class StaffIndexPageAttachment(Orderable, AbstractAttachment):
    page = ParentalKey('resources.StaffIndexPage',
                       related_name='attachments')

StaffIndexPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('introduction', classname='full'),
    InlinePanel(StaffIndexPage, 'related_links', label='Related links'),
    InlinePanel(StaffIndexPage, 'attachments', label='Attachments')
]

StaffIndexPage.promote_panels = [
    MultiFieldPanel(BaseIndexPage.promote_panels,
                    'Common page configuration'),
]


class StaffPage(BaseRichTextPage, TimeStampedModel):
    job_title = models.CharField(max_length=256)
    email = models.EmailField(max_length=256)
    kcl_url = models.URLField(
        max_length=256, blank=True, null=True, verbose_name='KCL staff page')
    linkedin_url = models.URLField(
        max_length=256, blank=True, null=True, verbose_name='LinkedIn')
    twitter = models.CharField(max_length=64, blank=True, null=True)
    photo = models.ForeignKey(
        Image, blank=True, null=True, on_delete=models.SET_NULL,
        related_name='+')

    subpage_types = []

    search_name = 'Staff page'


class StaffPageRelatedLink(Orderable, AbstractRelatedLink):
    page = ParentalKey(
        'resources.StaffPage', related_name='related_links')


class StaffPageAttachment(Orderable, AbstractAttachment):
    page = ParentalKey('resources.StaffPage', related_name='attachments')


StaffPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('job_title', classname='full'),
    FieldPanel('email', classname='full'),
    FieldPanel('content', classname='full'),
    MultiFieldPanel([
        FieldPanel('kcl_url'),
        FieldPanel('linkedin_url'),
        FieldPanel('twitter')
    ], 'Links'),
    ImageChooserPanel('photo'),
    InlinePanel(ProjectPage, 'related_links', label='Related links'),
    InlinePanel(ProjectPage, 'attachments', label='Attachments')
]

StaffPage.promote_panels = [
    MultiFieldPanel(BaseRichTextPage.promote_panels,
                    'Common page configuration'),
]
