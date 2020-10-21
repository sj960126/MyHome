<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
 <%@ page import ="myhomereal.*" %>
 <%request.setCharacterEncoding("utf-8");%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매확인</title>
<link rel="stylesheet" href="css/buy_product.css" />
<style>


h2 			{ text-align: center;  margin-top:60px; }

#paytable          { margin-left: 22%; margin-top: 3%; border:1px; width:1050px; height:180px; text-align: left;}
#paytable td,tr		{ border-bottom: 1px solid #444444; padding: 10px;  text-align:center;}

.showorder 			{ margin-left: 22%; margin-top: 3%; border:1px; width:1050px; height:180px; text-align: center;}
.showorder td,tr	{ border-bottom: 1px solid #444444; padding: 10px;  text-align:center;}

p 			{ margin-top:30px; text-align: center; }

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
<table class="showorder">
		<tr>
		<th>주문자명</th>
		<th>핸드폰번호</th>
		<th>이메일</th>
		<th>배송지</th>
		<tr>
		<td><%=request.getParameter("name")%></td>
		<td><%=request.getParameter("phonenum")%></td>
		<td><%=request.getParameter("mail")%></td>
		<td><%=request.getParameter("address")%></td>
		</tr>
  
</table>


<h2>결제 정보를 확인하세요</h2>
<%
	request.setCharacterEncoding("utf-8");
	session.setAttribute("ordername", request.getParameter("name"));
	session.setAttribute("orderphonenum", request.getParameter("phonenum"));
	session.setAttribute("ordermail", request.getParameter("mail"));
	session.setAttribute("orderaddress", request.getParameter("address"));
%>

<table id="paytable">
	<tr>
		<td colspan='3'>총 결제 가격:&nbsp; &nbsp;<%=session.getAttribute("totalsum")%>원&nbsp; &nbsp; &nbsp;</td>
	</tr>
	<tr>
		<td><lable>무통장 입금</lable></td>
		<td><lable>모블은행 202007-18-394110</lable></td>
		<td><button onclick ="location.href='Insert_OrderDetail.jsp'">결제</button></td>
	</tr>			
</table>

</div>	
</body>
</html>