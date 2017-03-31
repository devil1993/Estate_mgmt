package com;

import javax.servlet.http.HttpServletRequest;

public class RequestValidator {
	public static boolean validate(HttpServletRequest request){
		String sessionId = request.getSession().getId();
		String authenticatedSessonId = (String)request.getSession().getAttribute("authenticatedSessionId");
		User user = (User)request.getSession().getAttribute("user");
		return (sessionId == authenticatedSessonId)&&(user!=null) ;
	}
}
