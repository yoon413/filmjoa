package org.movie.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.Data;


@Data
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
    
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
    private String defaultUrl;
    
 
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        resultRedirectStrategy(request, response, authentication);
        
    }
 
    
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
    	//이전 Url 저장
        SavedRequest savedRequest = requestCache.getRequest(request, response);
    
        // 권한이 필요한 창을 호출해서 로그인되는 경우, 로그인 성공 후 이전 Url로 이동
        if(savedRequest!=null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
         // 바로 로그인 버튼을 눌러서 로그인을 시도하는 경우, 지정해둔 Url로 이동
        } else {
            redirectStratgy.sendRedirect(request, response, defaultUrl);
        }
        
    }
}



