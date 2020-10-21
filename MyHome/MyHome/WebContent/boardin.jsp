<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "myhomereal.*" %>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("up_title"); 
	String content = request.getParameter("up_content");
	String name = (String)session.getAttribute("ID");
	
	/* DAO 소스 작성 */
	/* insert into board values(?,?,?) */
			
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	MyHomeBoardVO VO = new MyHomeBoardVO(name, title, content);
	System.out.println(VO.getContent());
	boolean in = dao.binsert(VO);
	
	response.sendRedirect("page_board.jsp");
%>