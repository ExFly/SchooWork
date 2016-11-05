# -*- coding:utf-8 -*-
from .BaseHandler import BaseHandler
from modules import *
import tornado


class IndexHandler(BaseHandler):
    # @tornado.web.authenticated
    def get(self):
        option = self.get_option('图书管理系统|Index')
        power = self.get_cookie('power')
        if power:
            option['power'] = int(power) > 1
        else:
            option['power'] = False
        #user = tornado.escape.xhtml_escape(self.current_user)
        self.render("index.html", option=option)
