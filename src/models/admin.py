# -*- coding: UTF-8 -*-

import re
import random
import hashlib
import datetime

from datum.users import UsersDatum
from tools.salt import generate, verify
from etc import etc

class AdminModel:

    """
    TODO:
    """
    # TODO: 由于时间限制，暂时规定，登陆的时候，只要userid 和 auth是匹配的就可以说明用户匹配
    @staticmethod
    def generate_randauid(strs = '-_0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', size = 64):
        auid = ''
        while size > 0:
            auid = auid + random.choice(strs)
            size = size - 1
        return auid

    @staticmethod
    def generate_randsalt(strs = '0123456789abcdefghijklmnopqrstuvwxyz', size = 8):
        salt = ''
        while size > 0:
            salt = salt + random.choice(strs)
            size = size - 1
        return salt

    @staticmethod
    def generate_password(pswd, salt):
        return hashlib.md5(('AL.pswd:' + hashlib.md5((str(pswd) + '#'  + str(salt)).encode('utf-8')).hexdigest()).encode('utf-8')).hexdigest()

    @staticmethod
    def generate_authword(atms, salt):
        return hashlib.md5(('AL.auth:' + hashlib.md5((str(atms) + '$'  + str(salt)).encode('utf-8')).hexdigest()).encode('utf-8')).hexdigest()

    @staticmethod
    def chk_is_user_name(name):
        return 3 < len(name) < 32 and re.match(r'^[A-Za-z0-9](?:[-_]?[A-Za-z0-9]+)+$', name)

    @staticmethod
    def chk_is_user_pswd(pswd):
        return len(pswd) >= 6

    @staticmethod
    def chk_is_user_mail(mail):
        return 3 < len(mail) < 64 and re.match(r'^[^@\.]+(?:\.[^@\.]+)*@[^@\.]+(?:\.[^@\.]+)+$', mail)

    @staticmethod
    def chk_user_if_perm(user, perm):
        try:
            user = dict(user)
            return user and 'user_perm' in user and user['user_perm'] & perm == perm
        except:
            return False

    @staticmethod
    def chk_user_is_live(user):
        return AdminModel.chk_user_if_perm(user, 0x00000001)

    @staticmethod
    def chk_user_is_root(user):
        return AdminModel.chk_user_if_perm(user, 0x7FFFFFFF)

    @staticmethod
    def _signin(password, encode_pwd, salt):
        """

        :param password: 真是的密码
        :param encode_pwd: 加盐后的密码hash
        :param salt:
        :return:
        """
        return verify(password, salt, encode_pwd)

    @staticmethod
    def signup(username, password):
        # TODO: 没有超时返回异常
        ud = UsersDatum({'database_url': etc['database']['url'], 'debug': etc['debug'], })
        if ud.get_user_by_name(username):
            return
        hash_password, salt = generate(password)
        auid = AdminModel.generate_randauid()
        pwd = hash_password
        cretime = datetime.datetime.now()
        modtime = cretime
        userid = random.randint(1, 0x7ff)

        try:
            ud.add_one_user(userid=userid, username=username, pwd=pwd,
                            salt=salt, auid=auid, cretime=cretime, modtime=modtime)
        except:
            AdminModel.signup(username, password)

    @staticmethod
    def signin(username, password):
        ud = UsersDatum({'database_url': etc['database']['url'], 'debug': etc['debug'], })
        user = ud.get_user_by_name(username)
        return AdminModel._signin(password, user['password'], user['salt'])
