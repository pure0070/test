<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:forEach var="asd" items="${paramValues.fruits}" varStatus="state">
	<li>${state.count}: ${fruit}, ${state.index}</li>
</c:forEach>    
