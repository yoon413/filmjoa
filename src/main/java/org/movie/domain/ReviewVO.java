package org.movie.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long mno;
	private String user_id;
	private Long star_score;
	private String review_title;
	private String review_content;
	private Date regDate;
	private Date updateDate;
	
	//join
	private MovieVO movieVO;
}
