<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="myhomereal.*" %>
 <%    
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = (String)session.getAttribute("ID");
	String con = request.getParameter("con");
 
  	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	MyHomeReviewVO vo = new MyHomeReviewVO(id, name, con);
	boolean test = dao.insert(vo);
		
	if(test) {
		System.out.println("추가함");
	}
	else {
		System.out.println("못 추가함");
	}
		
	response.sendRedirect("buy_product.jsp");
%>
