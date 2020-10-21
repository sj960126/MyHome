<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import ="myhomereal.*" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>주문테이블</title>
<link rel="stylesheet" href="css/buy_product.css" />
<style>
body{
height :auto;
}
#mytable { width: 1080px; margin: auto; border-collapse:border-collapse; text-align: center; border-top: 1px solid #444444;}
#mytable td,th { padding: 5px 12px; text-align: center;  border-bottom: 1px solid #444444; }

#mytable td sum   { width:1080; height:50px;text-align: center; border-bottom: 1px solid #444444;}

#ordertable { width: 1080px; margin: auto; border-collapse:border-collapse; text-align: center; border-top: 1px solid #444444;}
#ordertable td,th { padding: 5px 12px; text-align: center;  border-bottom: 1px solid #444444; }

h2 				  {text-align: center; margin-top:50px; magin-bottom:30px;}

</style>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>
    $(function() {
        
        $('#btn-delete-row').click(function() {
            $('#mytable > tbody:last > tr:last').remove();
        });
    });
 
</script>



<body>
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
	<p><img src="img/template2.png"></p>
	
	
	<h2>주문정보를 확인해 주세요</h2><br>

<form  method="post" action="pay_page.jsp">
<table id="ordertable">
	<tr>
		<td>주문자명</td>
		<td><input type="text" name="name"></td>
	</tr>	
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phonenum"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="mail"></td>
	</tr>
	<tr>
		<td>배송지</td>
		<td><input type="text" name="address">		
		</td>
	</tr>		
	</table>	

	
	
	
<h2>주문하실 상품을 확인해 주세요</h2>




	<table id="mytable">
		<tr>
			<th>카테고리</th>
			<th>상품명</th>
			<th>가격</th>					
		</tr>
		<tr>
		
		<% ArrayList alist1 = (ArrayList)session.getAttribute("categoryList");
				if(alist1 == null) {
					out.println("상품없음");
				}else{					
					for(Object str1:alist1){
					out.println("<tr><td>"+str1 + "</td>");					
					}					
				}
			%>	
			<% ArrayList alist2 = (ArrayList)session.getAttribute("nameList");
				if(alist2 == null) {
					out.println("상품없음");
				}else{					
					for(Object str2:alist2){
					out.println("<td>"+str2 + "</td>");					
					}					
				}
			%>	
			<% ArrayList alist3 = (ArrayList)session.getAttribute("priceList");
				if(alist3 == null) {
					out.println("상품없음");
				}else{					
					for(Object str3:alist3){
					out.println("<td>"+str3 + "</td></tr>");					
					}					
				}
			%>		
		</tr>
		<tr>
			<td  colspan='4' >
			<h2>총 상품 가격은:<%=session.getAttribute("totalsum")%></h2>
			</td>
			<td>
				  <button>주문하기</button>
				   
				
			</td>
		</tr>
</table>
</form>
</body>
</html>