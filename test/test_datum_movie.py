# -*- coding:utf-8 -*-

import _context

from datum.movies import MovieDatum
from etc import etc

if __name__ == '__main__':
    ud = MovieDatum({'database_url': etc['database']['url'], 'debug': True, })
    # print(ud.get_movie_by_id(1))
    # print(ud.get_movies_by_name('金刚狼'))
    # print(ud.get_movie_by_IMDbURI('tt3315342'))
    # print(ud.get_movies_by_typename('剧情'))
    # print(ud.get_movie_people_by_movieid(1, '导演'))
    print(ud.result('select movies.playbill,movies.name_zh, score.mavg from movies, (select AVG(score) mavg from user_movie_impressions) score where movies.id=user_movie_impressions.movieid order by score.mavg limit 6;'))
