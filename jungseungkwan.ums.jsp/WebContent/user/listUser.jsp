<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jungseungkwan.ums.service.UserService" %>
<%@ page import="jungseungkwan.ums.service.UserServiceImpl" %>
<%@ page import="jungseungkwan.ums.domain.User" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>

<%
	UserService userService = new UserServiceImpl();
	List<User> user = userService.listUsers();
	
	pageContext.setAttribute("users",user);
	
%>
	<c:forEach var="user" items="${users}">
		<tr>
			<td><input type="radio" name="userNo" value="${user.userNo}" onClick="printUserName(this)"/>
				${user.userNo}
			</td>
			<td>${user.userName}</td>
			<td>${user.regDate}</td>
		</tr>
	</c:forEach>
	