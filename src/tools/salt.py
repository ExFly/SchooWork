#!/usr/bin/env python
#coding:utf-8

import random
import hashlib
import string


def generate(password):
    salt =  ''.join(random.sample(string.ascii_letters + string.digits, 32))
    data = password+salt
    hash_password = hashlib.sha1(data.encode('utf-8')).hexdigest()
    return (hash_password, salt)


def verify(password, salt, hash):
    data = password+salt
    return hashlib.sha1(data.encode('utf-8')).hexdigest() == hash


if __name__ == '__main__':
    en_password, salt = generate("123456")
    print(en_password, salt)
    print(verify("123456", salt, en_password)) # print "True"
    print(len('9a877134264f9041aa09e4e00adb47691bb1a8d8'))
    print(len('oW65gicszGPYMfvZCKeDLOBU4n8t2THw'))