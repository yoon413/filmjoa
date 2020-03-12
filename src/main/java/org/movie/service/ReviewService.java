package org.movie.service;

import java.util.List;

import org.movie.domain.Criteria;
import org.movie.domain.ReviewPageDTO;
import org.movie.domain.ReviewVO;

public interface ReviewService {

	public int RegisterReview(ReviewVO review);
	
	public List<ReviewVO> getReviewList(Long mno);
	
	public List<ReviewVO> readReviewByUser(String user_id);
	
	public int deleteReview (String user_id, Long mno);
	
	public ReviewPageDTO getListPage(Criteria cri, Long mno);
	
	public ReviewPageDTO getListPageByUser(Criteria cri, String user_id);
	
	public int updateReview (ReviewVO review);
	
	public Long avgReivewScore(Long mno);
	
	public boolean AllDelete(Long mno);
	
	
}
