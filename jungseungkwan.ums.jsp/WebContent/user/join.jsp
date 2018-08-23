<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jungseungkwan.ums.service.UserService" %>
<%@ page import="jungseungkwan.ums.service.UserServiceImpl" %>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<%
	String userName = request.getParameter("userName");
	if(userName !=null && !userName.equals("")){
		UserService userService = new UserServiceImpl();
		userService.join(userName);
%>
		<c:redirect url="../main.jsp?msgId=11"/>
<%
	}else{
%>
	<c:redirect url="..main.jsp?msgId=10" />
<%
	}
%>		
