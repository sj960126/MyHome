<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/buy_product.css" />
<style type="text/css">

.title		{text-align: left;}
h2 			{text-align: center;  margin-top:60px;}
#ordertable { width: 30%; height:90px; margin: auto; border-collapse:border-collapse; text-align: center; border-top: 1px solid #444444;}
#ordertable td,th { padding: 5px 12px; text-align: center;  border-bottom: 1px solid #444444; }

#paytable	{ width: 30%; height:90px; margin-top: 150px; border-collapse:border-collapse; text-align: center; border-top: 1px solid #444444;}
#paytable td,th { padding: 5px 12px; text-align: center;  border-bottom: 1px solid #444444; }
p 			{margin-top:30px;text-align: center; }

</style>
</head>
<body>
	<div class="wrap">		
		<div class="menubar">
            <ul class="menuItem">
                <li><a href="">Furniture</a></li>
                <li><a href="">Kitchen</a></li>
                <li><a href="">Bedroom</a></li>
                <li><a href="">Decoration</a></li>
                <li><a href="">Login</a></li>
				<li><a href="basket.jsp">Join</a></li>
        	</ul> 
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="#">Furniture</a>
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
<p><img src="img/template3.png"></p>
<h2>주문정보를 확인해 주세요</h2><br>

<form  method="post">
<table id="ordertable">
	<tr>
		<td>주문자명</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="number"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="mail"></td>
	</tr>
	<tr>
		<td>배송지</td>
		<td><input type="text" name="address"></td>
	</tr>
</table>
</form>

<h2>결제 정보를 확인하세요</h2><br>

<table id="paytable">
	<tr>
		<td>총 결제 가격은:&nbsp; &nbsp;<%=session.getAttribute("totalsum")%>원&nbsp; &nbsp; &nbsp;</td>
	</tr>
	<tr>
		<td><button onclick ="location.href='pay.jsp'">결제하기</button></td>
	</tr>			
</table>
</div>	
</body>
</html>