# -*- coding:utf-8 -*-

import pymysql

from sqlalchemy import create_engine
from sqlalchemy.sql import text

engine = create_engine('mysql+pymysql://root:toor@localhost/movieshare', echo=True, pool_size=20, max_overflow=10)
conn = engine.connect()

def test_sql_with_sqlalchemy():
    print(engine.pool.status())
    s = text(
        # "SELECT *  from users, userinfo where users.id=userinfo.userid limit 1,2;")
        # '[(2, 'test', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', datetime.datetime(2017, 3, 8, 15, 1, 38), datetime.datetime(2017, 3, 8, 15, 1, 41), 2, 'avatars2', 'test', 'test@email.com', 'famale', '15876448856')]'

        "SELECT *  from users, userinfo where users.id=userinfo.userid;")
        # [(1, 'root', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', datetime.datetime(2017, 3, 8, 15, 0, 36), datetime.datetime(2017, 3, 8, 15, 0, 40), 1, 'avatars1', 'root', 'root@email.com', 'man', '15965486523'),
        #  (2, 'test', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', datetime.datetime(2017, 3, 8, 15, 1, 38), datetime.datetime(2017, 3, 8, 15, 1, 41), 2, 'avatars2', 'test', 'test@email.com', 'famale', '15876448856')]
    # print(str(s))
    # print(conn.execute(s).fetchall())
    pool = []
    for i in range(29):
        pool.append(engine.connect())
    print(engine.pool.status())



if __name__ == '__main__':
    test_sql_with_sqlalchemy()
