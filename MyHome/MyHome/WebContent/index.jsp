<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "myhomereal.*" %>
    
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
            <ul class="menuItem">
                <%
                	if(session.getAttribute("ID") != null){ //로그인됨
                %>
            	<li><a> <%= session.getAttribute("ID")+"님" %></a></li>
                <li><a href="Furniture.jsp">Furniture</a></li>
                <li><a href="">Kitchen</a></li>
                <li><a href="">Bedroom</a></li>
                <li><a href="">Decoration</a></li>
                <li><a href="page_board.jsp">Q & A</a></li>
                <li><a href="useridpw/logout.jsp">Logout</a></li>
                <%	}else{
                %>
                <li><a href="Furniture.jsp">Furniture</a></li>
                <li><a href="">Kitchen</a></li>
                <li><a href="">Bedroom</a></li>
                <li><a href="">Decoration</a></li>
                <li><a href="page_board.jsp">Q & A</a></li>
                <li><a href="useridpw/page_login.jsp">Login</a></li>
				<li><a href="useridpw/page_join_menu.jsp">Join</a></li>
				<%	}
                %>
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
	</div>
</body>
	
	
</html>
