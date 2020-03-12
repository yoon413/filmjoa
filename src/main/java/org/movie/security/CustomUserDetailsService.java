package org.movie.security;

import org.movie.domain.UserVO;
import org.movie.mapper.UserMapper;
import org.movie.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private UserMapper userMapper;


	// 아이디로 인한 로그인
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + user_id);

		// user_id를 매개로 읽어와서 vo에 저장
		UserVO vo = userMapper.read(user_id);

		log.warn("queried by member mapper: " + vo);

		//null일 경우에 예외 던짐
		if(vo == null) {

			   throw new BadCredentialsException("NULL");

			  }
		
		return  new CustomUser(vo);
	} 

}
