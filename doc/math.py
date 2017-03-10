# -*- coding:utf-8-*-

"""
1位数加减乘除
2位数加减乘除
3位数加减乘除
"""

import random

class SuanShu:
    def __init__(self, wei):
        self.wei = wei

    def run(self):
        a = random.randint(1, 10**self.wei)
        b = random.randint(1, 10**self.wei)
        symbol = random.choice("+-*/")
        result = str(a)+symbol+str(b)
        # print(result)
        t = eval(result)
        if type(t)==int and t>=0:
            result = result+'='
            # print(result)
            return result
        return 0


if __name__ == '__main__':
    num = int(input('数量：'))
    wei = int(input('多少位加减乘除运算：'))
    result = list()
    while len(result) != num:
        t = SuanShu(wei).run()
        if t != 0:
            result.append(t)
    # print(result)
    with open("math.txt", 'w') as f:
        with open("math_result.txt", 'w') as f2:
            for i in range(num):
                f.write(result[i]+"\t\t")
                f2.write(result[i]+str(eval(str(result[i].replace('=', ''))))+"\t\t")
                if (i+1)%5 == 0:
                    f.write("\n")
                    f2.write("\n")
