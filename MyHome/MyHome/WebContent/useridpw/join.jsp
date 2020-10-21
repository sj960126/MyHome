<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "myhomereal.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("id"); 
	String userPw = request.getParameter("pw");
	String userName = request.getParameter("name");
	String userEmail = request.getParameter("email");
	String userAddr = request.getParameter("address");
	String userPhone = request.getParameter("phone"); /*String형이니 사용할때 Integer.parseInt(phone) 을 사용 해주세요!*/
	
	/* DAO 소스 작성 */
	/* select * from 회원테이블 where 이름칼럼명 = ? and id칼럼명 = ? */
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	boolean check = dao.joincheck(userName, userId);
	
	//회원정보 중복체크
	if (check){
		out.println("<script>alert('일치하는 회원이 있습니다. 아이디 혹은 비밀번호를 찾아주세요.'); location.href='page_login.jsp';</script>");
		out.flush();
	} else{
		/* DAO 소스 작성 */
		/* insert into 회원테이블 vlaues (회원정보) */
		MyHomeUsersVO vo = new MyHomeUsersVO(userName, userId, userPw, userEmail, userAddr, userPhone);
		
		boolean author = dao.insert1(vo);
		
		out.println("<script>alert('축하합니다. 가입이 완료되었습니다!'); location.href='page_login.jsp';</script>");
		out.flush();
	}
%>