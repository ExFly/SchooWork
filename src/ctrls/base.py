# -*- coding:utf-8 -*-

from collections import OrderedDict
import tornado.web

from models.admin import AdminModel
from datum.users import UsersDatum
from datum.movies import MovieDatum
from datum.Datum import Datum


class BaseHandler(tornado.web.RequestHandler):
    def initialize(self):
        self._caches = {'model': {}, 'datum': {}}

    def set_default_headers(self):
        self.set_header('server', self.settings['servs'])
        self.set_header('x-frame-options', 'SAMEORIGIN')
        self.set_header('x-xss-protection', '1; mode=block')
        self.set_header('cache-control', 'no-transform')

    def get_current_user(self):
        result = None

        _usid = self.get_cookie("_usid")
        _auid = self.get_secure_cookie("_auid")
        if _auid:
            _auid = str(_auid, 'utf-8')
        user = self.datum('users').get_user_by_id(_usid)
        if user and user['authid'] == _auid:
            result = self.get_cookie('_usid')
        return result

    def set_current_sess(self, user, days=1):
        _auid = str(user['authid'])
        _usid = str(user['id'])
        self.set_cookie("_usid", _usid, expires_days=days)
        self.set_secure_cookie("_auid", _auid, expires_days=days, httponly=True)
        self.get_logger('safe').info("user:{user} sigin".format(user=_usid))

    def human_valid(self):
        return True

    def del_current_sess(self):
        self.get_logger('safe').info("user:{user} logout".format(user=self.get_cookie('_usid')))
        self.clear_cookie("_auid")
        self.clear_cookie("_time")

    def input(self, *args, **kwargs):
        return self.get_argument(*args, **kwargs)

    def get_logger(self, name):
        return self.settings['logger'][name]

    def datum(self, name):
        setting = {'database_url': self.settings['database']['url'], 'debug': self.settings['debug'], }
        if name == 'users':
            return UsersDatum(setting)
        if name == 'movies':
            return MovieDatum(setting)
        if name == 'datum':
            return Datum(setting)

    def model(self, name):
        if name == 'admin':
            return AdminModel
        raise NotImplemented('model 中没有实现此模块：' + name)

    def get_nav(self):
        order_dict = OrderedDict({
            'hot': {
                'name': '热门',
                'url': '/movie/hot'
            },
            'new': {
                'name': '最新',
                'url': '/movie/new'
            },
            'classical': {
                'name': '经典',
                'url': '/movie/classical'
            },
        })
        filmtypes = self.datum('datum').result('select * from filmtype_meta;')
        for filmtype in filmtypes:
            order_dict[filmtype['type']] = {
                'name': filmtype['name'],
                'url': '/movie/{0}'.format(filmtype['type'])
            }
        return order_dict
