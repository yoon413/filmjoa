package org.movie.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

  private Long bno;
  private String brd_title;
  private String brd_content;
  private String user_id;
  private Date brd_regdate;
  private Date brd_updatedate;
  
  private Long brd_orginNo;
  private Long brd_groupOrd;
  private String brd_table;
  
}
