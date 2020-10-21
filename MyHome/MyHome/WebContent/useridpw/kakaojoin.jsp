<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "myhomereal.*" %>
<%
	request.setCharacterEncoding("utf-8");

	/*카카오변수 변수*/
    String kakaonickname = request.getParameter("kakaonickname");
	String kakaoid = request.getParameter("kakaoid");
	
	//카카오 session
    session.setAttribute("kakaonickname", kakaonickname);
    session.setAttribute("kakaoid", kakaoid);
    
    /* DAO 소스 작성 */
	/* select * from 회원테이블 where 이름칼럼명 = ? and id칼럼명 = ? */
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	boolean check = dao.joincheck(kakaonickname, kakaoid);
	
	if (check){
		out.println("<script>alert('일치하는 회원이 있습니다. 아이디 혹은 비밀번호를 찾아주세요.'); location.href='page_login.jsp';</script>");
		out.flush();
	}
	else{
		/* DAO 소스 작성 */
		/* insert into 회원테이블 vlaues (회원정보) */
		MyHomeUsersVO v1 = new MyHomeUsersVO(kakaonickname, kakaoid, kakaonickname, null, null, null);
		boolean kakao = dao.insert1(v1);
		
		out.println("<script>alert('축하합니다. 가입이 완료되었습니다!'); location.href='page_login.jsp';</script>");
		out.flush();
	}
%>