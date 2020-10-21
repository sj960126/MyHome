<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myhomereal.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 집</title>
<link rel="stylesheet" href="css/sub.css" />	
<style>
    .table {
      width : 100%;
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}
    
    #btitle:hover {color: red; text-decoration: underline;}
</style>
</head>
<body>
	<div class="wrap">
		<span class="logo"><a href="index.jsp"><img src="img/sub_logo.png"></a></span>
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
	
	<article>
	<h2>Q & A</h2>
	<div class ="product">
	<input type = "button" value = "글작성" style = "float: right;" onclick="location.href='page_boardwrite.jsp'">
		<table class ="table">
    		<tr>
        		<th>no</th>
		        <th>제목</th>
    		</tr>
		   <% 
		   MyHomeRealDAO dao = new MyHomeRealDAOImpl();
			List<MyHomeBoardVO> list = dao.boardList();
			int count =1;
			for(MyHomeBoardVO board : list) { 
				String content = URLEncoder.encode(board.getContent(),"utf-8");
				String title = URLEncoder.encode(board.getTitle(),"utf-8");
				String userName = (String)session.getAttribute("ID");
				%>
				<tr>
					<td><%= count++ %></td>
					<td><a href="page_boardfind.jsp?content=<%=content%>&title=<%= title%>&name=<%= userName%>"><%=board.getTitle() %></a></td>				
				</tr>
			<%	}	   %>
		</table>
    </div>
	</article>	
	</div>
</body>
</html>