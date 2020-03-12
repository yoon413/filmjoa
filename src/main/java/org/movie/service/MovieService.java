package org.movie.service;

import java.util.List;

import org.movie.domain.Criteria;
import org.movie.domain.ImageVO;
import org.movie.domain.MovieVO;

public interface MovieService {

	public List<MovieVO> getList(Criteria cri);
		
	public void register(MovieVO movie) ;
	
	public MovieVO getMovieInfo(Long mno);
	
	public int movieCnt();
	
	public ImageVO getImage(Long mno);
	
	public boolean updateMovie(MovieVO movie);
	
	public boolean deleteMovie(Long mno);
	
	public int getTotal(Criteria cri);
	
	public MovieVO getRandomMovie();
		
	public List<MovieVO> getKorMovie();
	
	public List<MovieVO> getForeignMovie();
	
	public List<MovieVO> getYearMovie();
	
	public List<MovieVO> getLatestMovie();
	
	
}
