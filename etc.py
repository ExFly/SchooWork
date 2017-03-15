# -*- coding: UTF-8 -*-

import sys
import time
import os.path
from tools.logger_ import runtime_logger, safe_logger

etc = {}

etc['debug'] = False or True
etc['error'] = False
etc['servs'] = 'AL/1.0.%s' % int(time.time())

etc['root_path'] = sys.path[0]
etc['login_url'] = '/signin'
etc['xsrf_cookies'] = True
etc['cookie_secret'] = 'Yoursecretcookie'
etc['template_path'] = os.path.join(etc['root_path'], 'src', 'views')
etc['log_path'] = os.path.join(etc['root_path'], 'log')
etc['assets'] = os.path.join(etc['root_path'], 'www', 'assets')
etc['static_path'] = os.path.join(etc['assets'])

etc['movie_assets'] = os.path.join(etc['root_path'], 'www', 'movie')

etc['logger'] = {'safe':safe_logger, 'runtime':runtime_logger, }

etc['database'] = {
    'url':"mysql+pymysql://root:toor@localhost/movieshare?charset=utf8",
    'pool_size': 200,
    'max_overflow': 220,
    }
