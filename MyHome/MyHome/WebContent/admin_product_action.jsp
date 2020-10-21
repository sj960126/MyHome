<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myhomereal.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<link href="css/admin_product.css" rel="stylesheet"/>
	<title>관리자 페이지</title>
<style>
	#chartwrap{
		margin-left : 8%;
		margin-top : 6%;
	}
</style>
</head>

 <body>
   <div class="wrap">
   <div class="logo">
			<a href="index.jsp"><img src="img/admin_logo.png"></a>
	</div>
   	<ul>
   		<li><a href="admin_user.jsp">회원 관리</a></li>
   		<li><a href="admin_product_action.jsp">상품 관리</a></li>
   		<li><a href="index.jsp">로그아웃</a></li>
   	</ul>
   		<div id ="chartwrap">
   		<script src="//www.google.com/jsapi"></script>
   		  <%
			request.setCharacterEncoding("utf-8");
			MyHomeRealDAO dao = new MyHomeRealDAOImpl();
	
		  %>

		<script>
		var data = [
			['종류', '판매량'],
			['Furniture',<%=Integer.parseInt(dao.getCount("가구"))%>],
			['Kitchen', <%=Integer.parseInt(dao.getCount("주방용품"))%>],
			['Bedroom', <%=Integer.parseInt(dao.getCount("침실용품"))%>],
			['Decoration',<%=Integer.parseInt(dao.getCount("데코"))%>],
		]; 

		var options = {
				title: '7월 종류별 판매량',
  				width: 1500, height: 600
		};
		
		google.load('visualization', '1.0', {'packages':['corechart']});
		google.setOnLoadCallback(function() {
			var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
  			chart.draw(google.visualization.arrayToDataTable(data), options);
		});
		</script>
		<div id="chart_div"></div>
   		
   		</div>
   </div>

</body>
</html>