package org.exfly.models;

import java.util.Iterator;
import java.util.List;

import org.exfly.models.*;

public class TestFilmtype {
	
	public static void main(String[] args) {
		List<Filetype> movieList = Filetype.getFiletypeList();
		Iterator<Filetype> it = movieList.iterator();
		while (it.hasNext()) {
			Filetype movie = it.next();
			System.out.println(movie.getName());
		}
	}
	
}
