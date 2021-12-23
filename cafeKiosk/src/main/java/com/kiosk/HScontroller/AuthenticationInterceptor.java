package com.kiosk.HScontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// preHandle() : controller보다 먼저 수행되는 메서드
		
		logger.info("AuthenticationInterceptor : preHandle()");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		
		if(obj == null) {
			logger.info("AuthenticationInterceptor : no login");
			// 로그인이 안되어 있는 상태 -> 로그인 페이지로 redirect
			response.sendRedirect("/pos");
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미이기 때문에
		// return을 true로 하면 컨트롤러 uri로 가게 된다. 
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// controller가 수행되고 화면이 보여지기 직전에 수행되는 메서드
		// 만약 controller에서 로그인 정보를 session에 저장시키지 않을 경우 이 메서드에서 수행해준다.
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}
