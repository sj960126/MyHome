<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="myhomereal.*" %>
    <%@ page import="java.util.List" %>
    
<%
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
    List<MyHomeUsersVO> list = dao.getList();
    
    System.out.println(list.toString());
%>
    
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <link href="css/admin_user.css" rel="stylesheet"/>
  <title>관리자 페이지</title>
<style>

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
   		<div class="view">
   		<% // 큰 테이블 maintb %>
   		<table id ="maintb" >
   			<% // 큰 테이블의 첫번째행 %>
	   		<tr>
	   			<th id="uu" colspan="3">회원관리</th></tr>
	   		<% // 큰 테이블의 두번째행 %>
	   		<tr>
	   			<% // 회원관리 테이블 td %>
	   			<td>
	   				<div id ="table1">
	   				<form action="deleteMyHomeUsers.jsp" method="post">
	   				<% // 회원관리 테이블 table1 %>
					<table>
					 <tr>
			            <td class=title>회원번호</td>
			            <td class=title>아이디</td>
			            <td class=title>비밀번호</td>
			            <td class=title>이름</td>
			            <td class=title>이메일</td>
			            <td class=title>전화번호</td>
			            <td class=title>주소</td>
			            <td class=title>주문번호</td>  
			            <td class=title></td>   
	            	</tr>
					<%
						for(MyHomeUsersVO vo : list) {
					%>
					<tr id ="tb1_tr">
						
						<td><%=vo.getUserNum_pk() %></td>
						<td><%=vo.getUserId() %></td>
						<td><%=vo.getUserPw() %></td>
						<td><%=vo.getUserName() %></td>
						<td><%=vo.getUserEmail() %></td>
						<td><%=vo.getUserPhone() %></td>
						<td><%=vo.getUserAddr() %></td>
						<td id=tittle><input type="button" onclick="location.href='deleteMyHomeUsers.jsp?num=<%=vo.getUserNum_pk()%>'"value="삭제" class = "submit"></td>
					</tr>
					<% } %>  
					</table>
					</form>
					</div>
	   			</td>
	   			<% // 줄간격 td %>
	   			<td style ="width : 3%;"></td>
	   			<% // 그래프 td %>
	   			<td>
	   				<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	   				<script type="text/javascript">
						google.charts.load("current", {packages:["corechart"]});
						google.charts.setOnLoadCallback(drawChart);
						function drawChart() {
							var data = google.visualization.arrayToDataTable([
								['회원', '지역'],
								['경기도', <%=Integer.parseInt(dao.add_select("경기도"))%>],
								['강원도', <%=Integer.parseInt(dao.add_select("강원도"))%>],
								['충청도', <%=Integer.parseInt(dao.add_select("충청도"))%>],
								['경상도', <%=Integer.parseInt(dao.add_select("경상도"))%>],
								['전라도', <%=Integer.parseInt(dao.add_select("전라도"))%>],]);
							var options = {
			          			title: '회원 지역',
			          			is3D: true
			          			};
			  				var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		        			chart.draw(data, options);
		      			}
					</script>
					<div id="piechart_3d" style="width: 600px; height: 500px;"></div>   		
	   			</td>
	   		</tr>
   		</table>
   		</div>	
   </div>
</body>
</html>