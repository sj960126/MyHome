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
	
	//카카오 session
    session.setAttribute("kakaonickname", kakaonickname);
    session.setAttribute("kakaoid", kakaoid);
    
	/* DAO 소스 작성 */
	/* select 이름, 아이디, 비밀번호 from 회원테이블 where id칼럼명 = ? and pw칼럼명 = ? */
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	
	//일반회원
	MyHomeUsersVO vo = dao.login(userId, userPw);
	//카카오회원
	MyHomeUsersVO v1 = dao.login(kakaoid, kakaonickname);

	/*로그인 안했을때,   location.href='page_login.jsp';로그인이 틀렸을때*/ 
// 	if(vo == null && v1 == null){
// 		out.println("<script>alert('회원정보가 일치하지 않습니다. 로그인을 다시 하세요.'); </script>");
// 		out.flush();
// 	}
// 	else 
	if(v1 != null){
		//카카오 로그인시 id/pw에 값 저장
		userId = kakaoid;
		userPw = kakaonickname;
	}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<title>나만의 집</title>
	<link rel="stylesheet" href="css/style.css" />	
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/prefixfree.min.js"></script>
	<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="js/custom.js"></script>
	
<title>나만의 집</title>
</head>
<body>
	<div class="wrap">
	<div class="menubar">
	<p>일반 회원 id : <%= userId %></p>
            <ul class="menuItem">
                <li><a href="Furniture.jsp">Furniture</a></li>
                <li><a href="">Kitchen</a></li>
                <li><a href="">Bedroom</a></li>
                <li><a href="">Decoration</a></li>
                <li><a href="useridpw/page_login.jsp">Login</a></li>
				<li><a href="useridpw/page_join.jsp">Join</a></li>
            </ul>
        </div>
	<div id="slide">
		<div class="logo">
			<a href="index.jsp"><img src="img/logo.png"></a>
		</div>

		<input type="radio" name="pos" id="pos1" checked>
		<input type="radio" name="pos" id="pos2">
		<input type="radio" name="pos" id="pos3">
		<input type="radio" name="pos" id="pos4">
		
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label>
			<label for="pos2"></label>
			<label for="pos3"></label>
			<label for="pos4"></label>
		</p>
		</div>
	<div class="line">
	</div>
	<footer>
		<img src="img/footer.jpg">
	</footer>
</body>
	</div>
	
</html>
