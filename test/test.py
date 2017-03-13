# -*- coding:utf-8 -*-
import os
import sys

def _is_zh(name):
    for ch in name:
        if u'\u4e00' <= ch <= u'\u9fff':
            return True
    return False


if __name__ == '__main__':
    # print(sys.path[0])
    # print(os.path.join(sys.path[0], 'test'))
    movietype = {
        "action":{
            "name":"动作",
            "url":"/action/",
        },
        "funny":{
            "name":"喜剧",
            "url":"/funny",
        }
    }

    for nav in movietype:
        print(movietype[nav]["name"], movietype[nav]["url"])
