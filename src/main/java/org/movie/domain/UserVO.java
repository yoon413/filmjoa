package org.movie.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {

	public String user_id;
	public String user_pw;
	public String user_email;
	public Date regDate;
	public Date updateDate;
	public boolean enabled;
	
	//join
	private List<AuthVO> authList;
}
 