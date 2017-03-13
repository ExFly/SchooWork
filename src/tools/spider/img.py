# -*- coding:utf-8 -*-

import requests
from datum.Datum import Datum
from etc import etc

imgpath = r'F:\ProjectD\MovieShare\www\movie\playbill'
ud = Datum({'database_url': etc['database']['url'], 'debug': True, })
def main():
    movies = ud.result("select poster, id from movies_spider_assignment order by id")
    for movie in movies:
    # if True:
        print(movie)
        url = movie['poster']
        with open(imgpath + "\\" + url.split(r'/')[-1], 'wb') as f:
            f.write(requests.get(url).content)
        path = r'/movie/img/playbill/'+ url.split(r'/')[-1]
        ud.affect(r"update movies set playbill=:path where id=:id;",
                  path=path, id=movie["id"])
