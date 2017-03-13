# -*- coding:utf-8 -*-

import _context
from sqlalchemy import create_engine
from sqlalchemy.sql import text

from datum.Datum import Datum
from etc import etc

engine = create_engine('mysql+pymysql://root:toor@localhost/movieshare', echo=True, pool_size=20, max_overflow=10)
conn = engine.connect()


def test_sql_with_sqlalchemy():
    d = Datum({'database_url': etc['database']['url'], 'debug': True, })
    print(
        d.result('SELECT * FROM users where id= :id', **dict(id=1))
    )
    d = Datum({'database_url': etc['database']['url'], 'debug': False, })
    print(
        d.single(
            'SELECT * FROM users;'
        ))
    print(
        d.affect(
            'SELECT * FROM users;'
        ))


if __name__ == '__main__':
    test_sql_with_sqlalchemy()
