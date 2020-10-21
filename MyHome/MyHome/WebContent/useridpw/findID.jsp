<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="myhomereal.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String userName = request.getParameter("idname");
	String userEmail = request.getParameter("idemail");
	
	/* DAO 소스 작성 */
	/* select id칼럼명 from 회원테이블 where 이름칼럼명 = name and 이메일칼럼명 = email */

		MyHomeRealDAO dao = new MyHomeRealDAOImpl();
		MyHomeUsersVO vo = dao.get(userName, userEmail);
	
		/* 객체명만 변경해주세요 */
		if(vo == null) {
			out.println("<script>alert('일치하는 회원정보가 없습니다.'); location.href='page_findUser.jsp';</script>");
			out.flush();
		}
		else {
			out.println("<script>alert('회원님의 아이디는 "+ vo.getUserId() + " 입니다.'); location.href='page_findUser.jsp';</script>");
			out.flush();
		}
%>