# -*- coding:utf-8 -*-

import _context

from datum.users import UsersDatum
from etc import etc
import datetime
import random
from models.admin import AdminModel


if __name__ == '__main__':
    ud = UsersDatum({'database_url': etc['database']['url'], 'debug': True, })
    # print(ud.get_user_by_id(1))
    # print(ud.get_user_by_name('root'))
    # print(ud.get_user_by_mail('root@email.com'))
    # print(ud.get_userinfo_by_id(1))
    # AdminModel.signup('username', 'password')
    # AdminModel.signup('username2', 'password')
    print(AdminModel.signin('password', 'f5dcb8df7b3d3d8d564f28fec0e18c8d23b1c9bc', 'su8bHSFR4WjmaQqEZNxC0roiPAzXhfkU'))
