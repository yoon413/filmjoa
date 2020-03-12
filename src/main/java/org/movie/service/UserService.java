package org.movie.service;

import org.movie.domain.UserVO;

public interface UserService {
	
	public void register(UserVO user);

	public int userIdCheck(String user_id);
	
	public UserVO getUserInfo(String user_id);
	
	public boolean modifyUserInfo(UserVO user);
	
	public boolean withdrawalUserInfo(String user_id);
		
	
}
