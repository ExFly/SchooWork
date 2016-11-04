# -*- coding: utf-8 -*-
import pymysql


def creat_db():
    conn = pymysql.connect(host='localhost', user ='root', passwd ='toor', charset ='UTF8')
    cur = conn.cursor()  # 获取一个游标对象
    try:
        #cur.execute("drop database {0}".format('bms'))
        cur.execute("create database {0} default character set utf8 default collate utf8_general_ci;".format('bms'))  # 执行对应的SQL语句
    except:
        print('?')

creat_db()
