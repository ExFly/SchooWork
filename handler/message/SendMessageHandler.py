# -*- coding: utf-8 -*-

import tornado.web
from ..BaseHandler import BaseHandler
from modules import *
import datetime

class SendMessageHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        self.render('comment/sendmessage.html')

    @tornado.web.authenticated
    def post(self):
        message = self.get_argument('message')
        session = Session()
        session.add(
            Message(uuid=self.get_current_user(),
                    message=message,
                    date=datetime.datetime.now()),
        )
        session.commit()
        session.close()
        self.redirect('/')

class SeeMessageHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        thisisadmin = int(self.get_cookie('power')) > 1
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            session = Session()
            m = session.query(Message).filter().all()
            self.render('comment/seemessage.html', opt={'messages': m})