# -*- coding:utf-8 -*-
import unittest
try:
    # cli
    from test_t import *
except ImportError:
    # pycharm
    from test.test_t import *

from test.datum.Datum import *

if __name__ == '__main__':
    unittest.main()
