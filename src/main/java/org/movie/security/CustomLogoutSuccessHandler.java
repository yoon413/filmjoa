package org.movie.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class CustomLogoutSuccessHandler  implements LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		// 궈한을 가지고 있고, 인증되어 있다면.. 세션 무효화 시킨다.
		if (authentication != null && authentication.getDetails() != null) {
            try {
                 request.getSession().invalidate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
		// 정상값 200 처리
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("/");
		
	}

}
