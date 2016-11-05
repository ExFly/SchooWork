# -*- coding: utf-8 -*-

import modules
from modules import Auth, Book, Session, BorrowReturn, Message
import uuid
import datetime


def init():
    modules.drop_db()
    modules.init_db()
    session = Session()
    auth_root = uuid.uuid4().hex
    auth_test = uuid.uuid4().hex
    session.add(Auth(uuid=auth_root, username='root', password='toor', power='5'),)
    session.commit()
    session.add_all([
        Auth(uuid=auth_test, username='test', password='test'),
        Auth(uuid=uuid.uuid4().hex, username='阿dee', password='toor'),
        Book(name='book1', num='1', category='c1', pubdate=datetime.date.today()),
        Book(name='book2', num='1', category='c1',
             pubdate=datetime.date.today()),
        Book(name='book3', num='1', category='c1',
             pubdate=datetime.date.today()),
        Book(name='book4', num='1', category='c1',
             pubdate=datetime.date.today()),
    ])
    session.commit()
    session.add_all([
        BorrowReturn(uuid=auth_root, book=1),
        BorrowReturn(uuid=auth_root, book=2),
        BorrowReturn(uuid=auth_root, book=3),
        Message(uuid=auth_test, message='aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                date=datetime.datetime.now()),
        Message(uuid=auth_test, message='bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
                date=datetime.datetime.now()),
        Message(uuid=auth_test, message='ccccccccccccccccccccccccccccccccccccc',
                date=datetime.datetime.now()),
    ])

    session.commit()
    session.close()

def get_session():
    session = Session()
    return session
def print_book():
    session = Session()
    a = session.query(Book).all()
    for i in a:
        print(i.id, i.name, i.num, i.category, i.publishing, i.pubdata, i.price,
              i.picture)

if __name__ == '__main__':
    init()
    # print_book()
