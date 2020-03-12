package org.movie.service;

import java.util.List;

import org.movie.domain.Criteria;
import org.movie.domain.ImageVO;
import org.movie.domain.MovieVO;
import org.movie.mapper.ImageMapper;
import org.movie.mapper.MovieMapper;
import org.movie.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class MovieServiceImpl implements MovieService {

	@Setter(onMethod_ = @Autowired)
	private MovieMapper movieMapper;

	@Setter(onMethod_ = @Autowired)
	private ImageMapper image;

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper review;

	@Override
	public List<MovieVO> getList(Criteria cri) {

		return movieMapper.getListWithPaging(cri);
	}

	@Override
	@Transactional
	public void register(MovieVO movie) {

		movieMapper.insertSelectKey(movie);

		if (movie.getTitleImage() == null) {
			return;
		}

		movie.getTitleImage().setMno(movie.getMno());
		image.insert(movie.getTitleImage());

	}

	@Override
	public int movieCnt() {

		return movieMapper.readMovieCnt();
	}

	@Override
	@Transactional
	public MovieVO getMovieInfo(Long mno) {
		movieMapper.viewCnt(mno);
		return movieMapper.readMovieInfo(mno);
	}

	@Override
	public ImageVO getImage(Long mno) {

		return image.findByMno(mno);
	}

	@Override
	@Transactional
	public boolean updateMovie(MovieVO movie) {

		boolean modifyResult = movieMapper.modifyMovie(movie) == 1;

		if (movie.getTitleImage() != null) {
			image.delete(movie.getMno());
			movie.getTitleImage().setMno(movie.getMno());
			image.insert(movie.getTitleImage());
		}

		return modifyResult;
	}

	@Override
	@Transactional
	public boolean deleteMovie(Long mno) {
		image.delete(mno);
		review.reviewAllDelete(mno);
		return movieMapper.delete(mno) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {

		return movieMapper.readTotal(cri);
	}

	@Override
	public MovieVO getRandomMovie() {

		return movieMapper.readRandomMovie();
	}

	@Override
	public List<MovieVO> getKorMovie() {

		return movieMapper.readKorMovie();
	}

	@Override
	public List<MovieVO> getForeignMovie() {

		return movieMapper.readForeignMovie();
	}

	@Override
	public List<MovieVO> getYearMovie() {

		return movieMapper.readYearMovie();
	}

	@Override
	public List<MovieVO> getLatestMovie() {

		return movieMapper.readLatestMovie();
	}

}
