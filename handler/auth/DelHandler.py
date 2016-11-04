# -*- coding: utf-8 -*-

import uuid
import tornado.web
from ..BaseHandler import BaseHandler
from modules import *


class AuthDelHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        session = Session()
        all_auth = session.query(Auth).all()

        self.render('authinfo.html', opmaper={'auth':all_auth,})

    @tornado.web.authenticated
    def post(self):
        del_uuid = self.get_argument('del_uuid')
        session = Session()
        permiss = session.query(Auth).filter(Auth.uuid==del_uuid).first().power
        thisisadmin = int(self.get_cookie('power')) > int(permiss)
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            session.query(Auth).filter(Auth.uuid == del_uuid).delete()
            session.commit()
        session.close()
        self.redirect('/authinfo')
