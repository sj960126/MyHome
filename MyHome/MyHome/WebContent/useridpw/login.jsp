<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "myhomereal.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	/*일반회원 변수*/
	String userId = request.getParameter("id_txt"); 
	String userPw = request.getParameter("pass_txt");
	
	/*카카오변수 변수*/
    String kakaonickname = request.getParameter("kakaonickname");
	String kakaoid = request.getParameter("kakaoid");
	
	/* DAO 소스 작성 */
	/* select 이름, 아이디, 비밀번호 from 회원테이블 where id칼럼명 = ? and pw칼럼명 = ? */
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	
	//일반회원
	MyHomeUsersVO vo = dao.login(userId, userPw);
	//카카오회원
	MyHomeUsersVO v1 = dao.login(kakaoid, kakaonickname);
	
	/*로그인 안했을때,  로그인이 틀렸을때*/ 
	if(vo == null && v1 == null){
		out.println("<script>alert('회원정보가 일치하지 않습니다. 로그인을 다시 하세요.');  location.href='page_login.jsp';</script>");
		out.flush();
	}
	else if(v1 != null){
		//카카오 session
		session.setAttribute("ID", kakaonickname);
	    session.setAttribute("PW", kakaoid);
		response.sendRedirect("../index.jsp");
	}
	else if (vo.getUserId().equals("admin")){
		response.sendRedirect("../admin_main.jsp");
	}
	else{
		//일반회원 session
	    session.setAttribute("ID", userId);
	    session.setAttribute("PW", userPw);
		response.sendRedirect("../index.jsp");
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<h2>sSBal</h2>
<p>일반 회원 id : <%= userId %></p>
<p>일반 회원 pass : <%= userPw %></p>
<p>일반 회원 pass : <%= kakaonickname %></p>
 <p><%=" (카카오톡) "+session.getAttribute("kakaonickname")%></p>
 <p> <%=" 카카오톡 id "+session.getAttribute("kakaoid")%></p>
 
    <form action="logout.jsp" method = "post">
    <button type = "submit" name = "submit">로그아웃</button></form>

</body>
</html>