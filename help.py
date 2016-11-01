# -*- coding: utf-8 -*-

import modules
from modules import Auth, Group, Session
import sqlalchemy
import uuid


def init():
    modules.drop_db()
    modules.init_db()
    session = Session()
    test = uuid.uuid4().hex
    session.add(Auth(uuid=test, username='root', password='toor'),)
    session.commit()
    session.add_all([
        Auth(uuid=uuid.uuid4().hex, username='test', password='test'),
        Auth(uuid=uuid.uuid4().hex, username='阿dee', password='toor'),
        Group(uuid=test, group='admin'),
    ])
    session.commit()

def get_session():
    session = Session()
    return session


if __name__ == '__main__':
    init()

