<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="myhomereal.*" %>



<%
	request.setCharacterEncoding("UTF-8");
	
	
	Long userNum_pk = Long.parseLong(request.getParameter("num"));
	
	
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	dao.delete(userNum_pk);
	
	response.sendRedirect("admin_user.jsp");
%>

