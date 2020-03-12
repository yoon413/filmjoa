package org.movie.service;

import java.util.List;

import org.movie.domain.Criteria;
import org.movie.domain.ReviewPageDTO;
import org.movie.domain.ReviewVO;
import org.movie.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;

	@Override
	public int RegisterReview(ReviewVO review) {

		return reviewMapper.insertReview(review);

	}

	@Override
	public List<ReviewVO> getReviewList(Long mno) {

		return reviewMapper.readReviewList(mno);

	}

	

	@Override
	public int deleteReview(String user_id, Long mno) {
		
		return reviewMapper.reviewDelete(user_id, mno) ;
	}

	@Override
	public ReviewPageDTO getListPage(Criteria cri, Long mno) {
		
		return new ReviewPageDTO(reviewMapper.readCountByMno(mno), reviewMapper.readReviewListWithPaging(cri, mno));
	}

	@Override
	public int updateReview(ReviewVO review) {
		
		return reviewMapper.modifyReview(review);
	}

	@Override
	public Long avgReivewScore(Long mno) {
		
		return reviewMapper.avgScore(mno);
	}

	@Override
	public boolean AllDelete(Long mno) {
		
		return reviewMapper.reviewAllDelete(mno) ==1;
	}

	@Override
	public List<ReviewVO> readReviewByUser(String user_id) {
		
		return reviewMapper.readReviewByUser(user_id);
	}

	@Override
	public ReviewPageDTO getListPageByUser(Criteria cri, String user_id) {
		log.info("진행중");
		return new ReviewPageDTO(reviewMapper.readCountByUser(user_id), reviewMapper.readReviewListWithPagingByUser(cri, user_id));
	}

	

	
}