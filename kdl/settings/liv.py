from base import *

CACHE_REDIS_DATABASE = '2'
CACHES['default']['LOCATION'] = '127.0.0.1:6379:' + CACHE_REDIS_DATABASE

INTERNAL_IPS = ('kdl.cch.kcl.ac.uk', )
ALLOWED_HOSTS = ['kdl.kcl.ac.uk']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'app_kdl_liv',
        'USER': 'app_kdl',
        'PASSWORD': '',
        'HOST': 'db-liv.kdl.cch.kcl.ac.uk'
    },
}


# -----------------------------------------------------------------------------
# Local settings
# -----------------------------------------------------------------------------

try:
    from local import *
except ImportError:
    pass
