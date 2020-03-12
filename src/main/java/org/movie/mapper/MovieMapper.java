package org.movie.mapper;

import java.util.List;

import org.movie.domain.Criteria;
import org.movie.domain.MovieVO;

public interface MovieMapper {

	public MovieVO readMovieInfo(Long mno);
	
	public Integer insertSelectKey(MovieVO movie);
	
	public int readMovieCnt();
	
	public List<MovieVO> getListWithPaging(Criteria cri);
	
	public void viewCnt(Long mno);
	
	public int modifyMovie(MovieVO movie);
	
	public int delete(Long mno);
		
	public int readTotal(Criteria cri);
	
	public MovieVO readRandomMovie();
	
	public List<MovieVO> readKorMovie();
	
	public List<MovieVO> readForeignMovie();
	
	public List<MovieVO> readYearMovie();
	
	public List<MovieVO> readLatestMovie();
	
	
	
	
	
}
