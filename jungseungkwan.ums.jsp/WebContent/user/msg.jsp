<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${param.msgId==11}">
		<c:set var="msg">사용자 등록 성공.</c:set>
	</c:when>
	
	<c:when test="${param.msgId==10}">
		<c:set var="msg">사용자 등록 실패.</c:set>
	</c:when>

</c:choose>