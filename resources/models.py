from wagtailbase.base import (
    AbstractRelatedLink, AbstractAttachment, BaseIndexPage, BaseRichTextPage)
from wagtailbase.models import HomePage

from model_utils.models import TimeStampedModel
from django.shortcuts import render

from modelcluster.tags import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from taggit.models import TaggedItemBase

from wagtail.wagtailadmin.edit_handlers import (
    FieldPanel, InlinePanel, MultiFieldPanel)
from wagtail.wagtailcore.models import Orderable
from wagtail.contrib.wagtailroutablepage.models import route
from wagtail.wagtailsearch import index


class PortfolioIndexPage(BaseIndexPage):
    search_name = 'Portfolio'

    subpage_types = ['ProjectPage']

    @route(r'^$')
    def serve_listing(self, request):
        """main listing"""
        projects = ProjectPage.objects.filter(
            live=True, path__startswith=self.path).order_by('-created')

        print projects

        return render(request,
                      self.get_template(request),
                      {'self': self,
                       'projects': projects })

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
