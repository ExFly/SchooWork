package org.exfly.models;

import java.util.Iterator;
import java.util.List;

public class TestMovies {

	public static void main(String[] args) {
//		org.exfly.models.Movie.commentMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1", 10, "励志，超级好看");
//		org.exfly.models.Movie.wantedMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1");
//		org.exfly.models.Movie.wantedMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1");
//		org.exfly.models.Movie.hadsawMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1");
		
		List<Movie> movieList = Movie.getMoviesbyPage(1, 10);
		Iterator<Movie> it = movieList.iterator();
		while (it.hasNext()) {
			Movie movie = it.next();
			System.out.println(movie.getName_zh());
		}
	}

}
