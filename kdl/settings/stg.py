from base import *

CACHE_REDIS_DATABASE = '1'
CACHES['default']['LOCATION'] = '127.0.0.1:6379:' + CACHE_REDIS_DATABASE

INTERNAL_IPS = INTERNAL_IPS + ('137.73.254.10', )
ALLOWED_HOSTS = ['kdl-stg.cch.kcl.ac.uk']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'app_kdl_stg',
        'USER': 'app_kdl',
        'PASSWORD': '',
        'HOST': 'kdl.cch.kcl.ac.uk'
    },
}


# -----------------------------------------------------------------------------
# Local settings
# -----------------------------------------------------------------------------

try:
    from local import *
except ImportError:
    pass
