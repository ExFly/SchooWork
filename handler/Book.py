# -*- coding: utf-8 -*-

import tornado.web
from .BaseHandler import BaseHandler
from modules import *


class AllBookInfoHandler(BaseHandler):

    def get(self):
        session = Session()
        all_book = session.query(Book).all()
        self.render("book.html", opmaper={'book':all_book,})

    def post(self):
        session = Session()
        all_book = session.query(Book).all()
        self.render("book.html", opmaper={'book': all_book,})


class BookAdderHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        self.render('addbook.html')

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
            pubdata = self.get_argument('pubdata')
            price = self.get_argument('price')
            picture = self.get_argument('picture') or 'default.png'

            session.add(
                Book(name=name, num=num, category=category,
                     publishing=publishing,
                     pubdata=pubdata, price=price, picture=picture)
            )
            session.commit()
            session.close()
            self.redirect('/allbookinfo')

class BookEditerHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self, bknm):
        self.set_cookie('bookid', bknm)
        self.render('alterbook.html', bknm=bknm)

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
                pubdate = self.get_argument('pubdata')
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
        self.render('delbook.html')

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
