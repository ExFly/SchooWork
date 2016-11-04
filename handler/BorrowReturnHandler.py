# -*- coding: utf-8 -*-

import tornado.web
from .BaseHandler import BaseHandler
from modules import *
from sqlalchemy import and_

class BorrowReturnHandler(BaseHandler):

    @tornado.web.authenticated
    def get(self):
        # self.render("borrowreturn.html")
        session = Session()
        all_book = session.query(Book).filter(and_(BorrowReturn.uuid == self.get_current_user(),
                                        BorrowReturn.book==Book.id))
        self.render('book.html', opmaper={'book': all_book,})

    @tornado.web.authenticated
    def post(self):
        book = self.get_argument('bookid')
        tp = self.get_argument('tp')
        uid = self.get_current_user()
        session = Session()

        if(tp == 'borrow'):
            session.add(
                BorrowReturn(uuid=uid, book=book)
            )
        elif(tp == 'return'):
            session.query(BorrowReturn).filter(BorrowReturn.book == book).delete()
        else:
            print('error not borrow and return!')
        session.commit()
        session.close()
        self.redirect('/allbookinfo')
