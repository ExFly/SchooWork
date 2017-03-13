# -*- coding: UTF-8 -*-

from sqlalchemy import create_engine
from sqlalchemy.sql import text


class Datum(object):
    """
    begin 开始事务
    commit 提交
    rollback 回滚
    """
    def __init__(self, config):
        self.config = {'database_url': '', 'debug': False, }
        self.config.update(config)
        self.source = create_engine(self.config['database_url'], echo=self.config['debug'])

    def result(self, *args, **kwargs):
        """return all rows

        >>> d = Datum({'database_url': etc['database']['url'], 'debug': True, })
        >>> d.result('SELECT * FROM users where id= :id', id=1)
        >>> d.result('SELECT * FROM users where id= :id', **dict(id=1))

        :param args: sql string with prepare to bindpar
        :param kwargs:
        :return: list of result
        """
        conn = self.source.connect()
        ret = conn.execute(text(*args), **kwargs).fetchall()
        conn.close()
        return ret

    def single(self, *args, **kwargs):
        """return one row

        >>> d = Datum({'database_url': etc['database']['url'], 'debug': True, })
        >>> d.single('SELECT * FROM users where id= :id', id=1)
        >>> d.single('SELECT * FROM users where id= :id', **dict(id=1))

        :param args:
        :param kwargs:
        :return:
        """
        conn = self.source.connect()
        ret = conn.execute(text(*args), **kwargs).fetchone()
        conn.close()
        return ret

    def affect(self, *args, **kwargs):
        """执行事务

        :param args:
        :param kwargs:
        :return:
        """
        con = self.source.connect()
        result = None
        trans = con.begin()
        try:
            result = con.execute(text(*args), **kwargs)
            trans.commit()
        except Exception as e:
            trans.rollback()
            import traceback
            traceback.print_exc()
        return result
