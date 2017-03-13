# -*- coding:utf-8 -*-

from datum.Datum import Datum


class MovieDatum(Datum):
    def get_movie_by_id(self, movie_id):
        # TODO: 电影相关信息有点多，相应的可以创建缓存，防止频繁查询数据库
        result = self.single('select * from movies where id=:movie_id;', movie_id=movie_id)
        return result

    def get_movies_by_name(self, movie_name):
        result = None
        # TODO: 模糊查询sql有问题 中文暂时没问题，英文有问题
        # TODO: 需要限制返回数量，否则内存炸了
        sql = 'select * from movies where name_zh rlike :movie_name;'
        if not self._is_zh(movie_name):
            sql.replace('name_zh', 'name_en')
        result = self.result(sql, movie_name=movie_name)
        return result

    def get_movie_by_IMDbURI(self, IMDbURI):
        # TODO: 与get_movie_by_id类似 电影相关信息有点多，相应的可以创建缓存，防止频繁查询数据库
        result = self.single('select * from movies where IMDbURI=:IMDbURI;', IMDbURI=IMDbURI)
        return result

    def get_movies_by_typename(self, movie_type):
        # TODO: 需要限制返回数量，否则内存炸了
        result = self.result('select * from movies,filmtype,filmtype_meta where movies.id=filmtype.movieid and filmtype.filmtype=filmtype_meta.id and filmtype_meta.type=:movie_type;', movie_type=movie_type)
        return result

    def get_movie_people_by_movieid(self, movieid, people_type):
        """
        :param movieid:
        :param people_type: 导演 编剧 主演
        :return:
        """
        movie_people_sql = 'select famouspeoples.* from movies_peoples,famouspeoples where movies_peoples.people_id=famouspeoples.id and movies_peoples.type=":movietype" and movies_peoples.movie_id=:movieid'
        result = self.result(movie_people_sql.replace(':movietype', people_type), movieid=movieid)
        return result

    def hadsaw_want(self, userid, hadsaw_want, movieid):
        result = self.single(
            'select hadsaw_wanted from user_movie_impressions where userid=:userid and movieid=:movieid;',
            userid=userid, movieid=movieid)
        if not result:
            self.affect("insert into user_movie_impressions(hadsaw_wanted, userid, "
                        "movieid) value(:hadsaw_wanted, :userid, :movieid)",
                        hadsaw_wanted=hadsaw_want, userid=userid, movieid=movieid)
        else:
            self.affect("update user_movie_impressions set hadsaw_wanted=:hadsaw_wanted where userid=:userid "
                        "and movieid=:movieid;",
                        hadsaw_wanted=hadsaw_want, userid=userid, movieid=movieid)

    def _is_zh(self, name):
        for ch in name:
            if u'\u4e00' <= ch <= u'\u9fff':
                return True
        return False
