package org.movie.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,

			AuthenticationException exception) throws IOException, ServletException {

		log.error("==========================================");

		log.error(exception);

		//빈 값이거나 가져온 값이 다른 경우에 로그인 실패 처리
		if (exception.getMessage().equals("NULL") || exception.getClass().getName()
				.equals("org.springframework.security.authentication.BadCredentialsException") ) {

			getRedirectStrategy().sendRedirect(request, response, "/main/loginFailure");

		}
		

	}

}
