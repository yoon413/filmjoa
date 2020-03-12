package org.movie.service;

import org.movie.domain.UserVO;
import org.movie.mapper.ReviewMapper;
import org.movie.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	@Override
	@Transactional
	public void register(UserVO user) {

		log.info("register...." + user);
		mapper.insert(user);
		mapper.insertAuth(user.getUser_id());
	}

	@Override
	public int userIdCheck(String user_id) {
		
		return mapper.checkId(user_id);
	}

	@Override
	public UserVO getUserInfo(String user_id) {
		
		return mapper.readUserInfo(user_id);
	}

	@Override
	public boolean modifyUserInfo(UserVO user) {
		
		return mapper.updateUserInfo(user) ==1;
	}

	@Override
	@Transactional
	public boolean withdrawalUserInfo(String user_id) {
		mapper.deleteUserAuth(user_id);
		return mapper.deleteUserInfo(user_id) ==1 ;
	}

	

	

	

}
