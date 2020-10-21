<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매확인</title>
<link rel="stylesheet" href="css/buy_product.css" />
<style type="text/css">
body{
height:auto;}
.title		{text-align: left;}
h2 			{text-align: center;  margin-top:60px;}
#ordertable { width: 30%; height:90px; margin: auto; border-collapse:border-collapse; text-align: center; border-top: 1px solid #444444;}
#ordertable td,th { padding: 5px 12px; text-align: center;  border-bottom: 1px solid #444444; }

#paytable	{ width: 30%; height:90px; margin-top: 150px; border-collapse:border-collapse; text-align: center; border-top: 1px solid #444444;}
#paytable td,tr { padding: 5px 12px; text-align: center;  border-bottom: 1px solid #444444; }

p 			{margin-top:30px;text-align: center; }

</style>
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
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="Furniture.jsp">Furniture</a>
		  <a href="#">Kitchen</a>
		  <a href="#">Bedroom</a>
		  <a href="#">Decoration</a>
		</div>
		<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
		<script>
			function openNav() {
			    document.getElementById("mySidenav").style.width = "250px";
			}
			
			function closeNav() {
			    document.getElementById("mySidenav").style.width = "0";
			}
		</script>
	</div>
<p><img src="img/template4.png"></p>

</div>	
</body>
</html>