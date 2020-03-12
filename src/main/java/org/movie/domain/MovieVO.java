package org.movie.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MovieVO {

	private Long mno;
	private String title;
	private String director;
	private String trailer;
	private String plot;
	
	private String actor1;
	private String actor2;
	private String actor3;
	private String actor4;
	
	private String genre1;
	private String genre2;
	private String genre3;
	
	private String age;
	private Date regdate;
	private Date updatedate;
	private String release;
	
	private int participation;
	private int score;
	private int viewCnt;
	private String time;
	private double avg_score;
	private Long view_cnt;
	private String thumbnail_path;
	private String nation;
	
	private ImageVO titleImage;
	
	//resultMap
	private ImageVO imageVO;
	
}
