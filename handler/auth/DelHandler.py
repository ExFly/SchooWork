# -*- coding: utf-8 -*-

import uuid
import tornado.web
from ..BaseHandler import BaseHandler
from modules import *


class AuthDelHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        option = self.get_option('删除读者|Index')
        self.render('delauth.html', option=option)

    @tornado.web.authenticated
    def post(self):
        username = self.get_argument('username')
        session = Session()
        power = session.query(Auth).filter(Auth.username == username).first()
        if power:
            permiss = power.power
        else:
            permiss = 1
        thisisadmin = int(self.get_cookie('power')) > int(permiss)
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            session.query(Auth).filter(Auth.username == username).delete()
            session.commit()
        session.close()
        self.redirect('/authinfo')

class AuthInfoHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self):
        thisisadmin = int(self.get_cookie('power')) > 1
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            session = Session()
            all_auth = session.query(Auth).all()
            option = self.get_option('读者信息|Index')
            option['authinfo'] = all_auth
            self.render('authinfo.html', option=option)

    def post(self):
        self.get()