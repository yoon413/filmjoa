package org.movie.mapper;

import org.movie.domain.UserVO;

public interface UserMapper {
	
	public void insert(UserVO user);
	
	public void insertAuth(String user_id);

	public int checkId(String user_id);
	
	public UserVO read(String user_id);
	
	public UserVO readUserInfo(String user_id);
	
	public int updateUserInfo(UserVO user);
	
	public int deleteUserInfo(String user_id);
	
	public int deleteUserAuth(String user_id);
}
