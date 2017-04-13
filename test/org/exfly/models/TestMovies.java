package org.exfly.models;

public class TestMovies {

	public static void main(String[] args) {
		org.exfly.models.Movie.commentMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1", 10, "励志，超级好看");
		org.exfly.models.Movie.wantedMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1");
		org.exfly.models.Movie.wantedMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1");
		org.exfly.models.Movie.hadsawMovie("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957", "1");
	}

}
