from base import *

DEBUG = True

INTERNAL_IPS = ('kdl-dev.cch.kcl.ac.uk', )

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'app_kdl_dev',
        'USER': 'app_kdl',
        'PASSWORD': '',
        'HOST': 'db-dev.kdl.cch.kcl.ac.uk'
    },
}

LOGGING_LEVEL = logging.DEBUG

LOGGING['loggers']['django_auth_ldap']['level'] = LOGGING_LEVEL
LOGGING['loggers']['kdl']['level'] = LOGGING_LEVEL

TEMPLATES[0]['OPTIONS']['debug'] = True

# -----------------------------------------------------------------------------
# Django Extensions
# http://django-extensions.readthedocs.org/en/latest/
# -----------------------------------------------------------------------------

try:
    import django_extensions

    INSTALLED_APPS = INSTALLED_APPS + ('django_extensions',)
except ImportError:
    pass

# -----------------------------------------------------------------------------
# Django Debug Toolbar
# http://django-debug-toolbar.readthedocs.org/en/latest/
# -----------------------------------------------------------------------------

try:
    import debug_toolbar

    INSTALLED_APPS = INSTALLED_APPS + ('debug_toolbar',)
    MIDDLEWARE_CLASSES = MIDDLEWARE_CLASSES + (
        'debug_toolbar.middleware.DebugToolbarMiddleware',)
    DEBUG_TOOLBAR_PATCH_SETTINGS = True
except ImportError:
    pass

# -----------------------------------------------------------------------------
# Local settings
# -----------------------------------------------------------------------------

try:
    from local import *
except ImportError:
    print('failed to import local settings')
    raise ImportError('Error importing local settings')
