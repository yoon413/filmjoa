package org.movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.movie.domain.Criteria;
import org.movie.domain.ReviewVO;

public interface ReviewMapper {

	public int insertReview(ReviewVO review);
	
	public List<ReviewVO> readReviewList(Long mno);
	
	public List<ReviewVO> readReviewByUser(String user_id);
	public boolean checkReviewId(String user_id);
	
	public int reviewDelete(
			@Param("user_id") String user_id, 
			@Param("mno") Long mno);
	
	public List<ReviewVO> readReviewListWithPaging(@Param("cri") Criteria cri, @Param("mno") Long mno);
	
	public List<ReviewVO> readReviewListWithPagingByUser(@Param("cri") Criteria cri, @Param("user_id") String user_id);

	public int readCountByMno(Long mno);
	
	public int readCountByUser(String user_id);
	
	public int modifyReview(ReviewVO review);
	
	public Long avgScore(Long mno);
	
	public int reviewAllDelete(Long mno);
	
}
