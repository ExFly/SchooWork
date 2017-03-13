# -*- coding:utf-8 -*-

"""
暂时将使用到的logger都放到Application的settings中，在其他位置去用
在BaseHandler中配置获得logger的方法
"""
import os
import sys
import logging.config
import yaml


with open(os.path.join(sys.path[0], 'config.yaml')) as f:
    config = yaml.load(f)
    logging.config.dictConfig(config)

def test():
    verbose = logging.getLogger('verbose.example.SomeClass')
    audit = logging.getLogger('audit.example.SomeClass')
    root = logging.getLogger('root')
    verbose.info('Verbose info')
    audit.info('Audit info')
    root.info('Root info')

runtime_logger = logging.getLogger('runtime')
safe_logger = logging.getLogger('safe')
