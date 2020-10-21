<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import ="myhomereal.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("pwid");
	String userEmail = request.getParameter("pwemail");
	
	/* DAO 소스 작성 */
	/* select pw칼럼명 from 회원테이블 where 아이디칼럼명 = id and 이메일칼럼명 = email */
	
		MyHomeRealDAO dao = new MyHomeRealDAOImpl();
		MyHomeUsersVO vo = dao.get2(userId, userEmail);
		
		/* 객체명만 변경해주세요 */
		if(vo == null) {
			out.println("<script>alert('일치하는 회원정보가 없습니다.'); location.href='page_findUser.jsp';</script>");
			out.flush();
		}
		else {
			out.println("<script>alert('회원님의 비밀번호는 "+ vo.getUserPw() + " 입니다.'); location.href='page_findUser.jsp';</script>");
			out.flush();
		}
%>