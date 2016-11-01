# -*- coding:utf-8 -*-
from .BaseHandler import BaseHandler
from modules import *
import tornado


class IndexHandler(BaseHandler):
    # @tornado.web.authenticated
    def get(self):
        #user = tornado.escape.xhtml_escape(self.current_user)
        username = self.get_cookie('username')
        if username:
            is_signed = True
        else:
            is_signed = False

        option = {
            'username':username,
            'is_signed':is_signed,
            'title': 'Main Test Page',
        }
        self.render("index.html", option=option)
