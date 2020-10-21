<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//세션에 담긴값 초기화
    session.invalidate();

	response.sendRedirect("../index.jsp");
%>