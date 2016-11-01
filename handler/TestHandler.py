# -*- coding:utf-8 -*-

import logging
import tornado
import tornado.web
from handler.BaseHandler import BaseHandler
import config
from . import signin_
from modules import *


logging.basicConfig(format=config.LOG_FORMAT, filename=config.LOG_POSITION, filemode='w+')
log = logging.getLogger('debug_')
log.setLevel(config.LOG_LEVAL)


class MainHandler(BaseHandler):
    # @tornado.web.authenticated
    def get(self):
        # user = tornado.escape.xhtml_escape(self.current_user)
        # username = self.get_cookie('username')
        # print('when main' + str(self.session.session))
        # is_signed = self.get_cookie('id')
        # option = {
        #     'username':username,
        #     'is_signed':is_signed,
        #     'title': 'Main Test Page',
        # }
        self.render("index.html")


# class LoginHandler(BaseHandler):
#     def get(self):
#         self.render("login.html")
#
#     def post(self):
#         username = self.get_argument('username')
#         password = self.get_argument('password')
#
#         session = Session()
#         is_signin, uuid = signin_(username, password, session)    #xss
#
#         if not (is_signin):
#             self.redirect('/login')
#
#         self.set_cookie("username", username)
#         self.set_cookie("uuid", uuid)
#         self.redirect('/')


class LogoutHandler(BaseHandler):

    def get(self):
        uid = self.get_current_user()
        self.session.session = {}
        self.clear_all_cookies()
        self.redirect("/")

    def post(self):
        uid = self.get_current_user()
        self.session.session = {}
        self.clear_all_cookies()
        self.redirect("/")


if config.DEBUG:
    class TestHandler(BaseHandler):
        def get(self):
            self.session["a"]='a'
else:
    class TestHandler(BaseHandler):
        def get(self):
            self.write("")
