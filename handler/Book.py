# -*- coding: utf-8 -*-

import tornado.web
from .BaseHandler import BaseHandler
from modules import *


class AllBookInfoHandler(BaseHandler):

    def get(self):
        option = self.get_option('书籍信息|Index')
        session = Session()
        all_book = session.query(Book).all()
        option['book'] = all_book
        self.render("bookinfo.html", option=option)

    def post(self):
        self.get()


class BookAdderHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        option = self.get_option('增加书籍|Index')
        option['tp'] = 'add'
        self.render('addalterbook.html', option=option)

    @tornado.web.authenticated
    def post(self):

        thisisadmin = int(self.get_cookie('power')) > 3
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            session = Session()
            name = self.get_argument('name')
            num = self.get_argument('num')
            category = self.get_argument('category')
            publishing = self.get_argument('publishing')
            pubdate = self.get_argument('pubdate')
            price = self.get_argument('price')
            picture = self.get_argument('picture') or 'default.png'

            session.add(
                Book(name=name, num=num, category=category,
                     publishing=publishing,
                     pubdate=pubdate, price=price, picture=picture)
            )
            session.commit()
            session.close()
            self.redirect('/allbookinfo')

class BookEditerHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self, bknm):
        option = self.get_option('修改书籍|Index')
        option['tp'] = 'edit'
        self.set_cookie('bookid', bknm)
        option['bknm'] = bknm
        self.render('addalterbook.html', option=option)

    @tornado.web.authenticated
    def post(self, bknm):
        thisisadmin = int(self.get_cookie('power')) > 3
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            id = self.get_cookie('bookid')

            session = Session()
            bookinfo = session.query(Book).filter_by(id=id).scalar()
            if bookinfo:
                name = self.get_argument('name')
                num = self.get_argument('num')
                category = self.get_argument('category')
                publishing = self.get_argument('publishing')
                pubdate = self.get_argument('pubdate')
                price = self.get_argument('price')
                picture = self.get_argument('picture')

                bookinfo.name = name
                bookinfo.num = num
                bookinfo.category = category
                bookinfo.publishing = publishing
                bookinfo.pubdate = pubdate
                bookinfo.price = price
                bookinfo.picture = picture or 'default.png'
                session.commit()
                session.close()
            else:
                print('del fault {0} not found!'.format(id))
            self.redirect('/allbookinfo')


class DelHandlerHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        option = self.get_option('删除书籍|Index')
        self.render('delbook.html', option=option)

    @tornado.web.authenticated
    def post(self):
        thisisadmin = int(self.get_cookie('power')) > 3
        if not thisisadmin:
            print('权限不足')
            self.redirect('/')
        else:
            id = self.get_argument('id')
            session = Session()
            session.query(Book).filter_by(id=id).delete()
            session.commit()
            session.close()
            self.redirect('/allbookinfo')
