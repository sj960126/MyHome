<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 집</title>
<link rel="stylesheet" href="css/sub.css" />	
<style>
    .table {
      width : 1350px;
      border-collapse: collapse;
      border-top: 3px solid #168;
      margin-left : 275px;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 5px;
      border: 1px solid #ddd;
    }

    .table tr td:first-child {
      text-align: center;
    }
    .table caption{
      caption-side: bottom; display: none;
    }
    #btitle:hover {
      color: red; text-decoration: underline;
    }
    .emdfhr { 
      height:40px; font-weight:bold; font-size:30px;
    }
    .titleth { height:0px; }
    textarea {
    	width:100%; height:300px;
    }
    .btn {
      width : 100px; padding : 5px; color: #168; background: #f0f6f9; float:right;
      font-size : 15pt;
      font-weight : bold;
    }
    .btndiv { width:1300px; margin: 20px auto; }
    .content { resize : none; font-size:15pt; }
    .title { width:100%; height:100%; font-size:15pt; }
    .contentth { height: 350px;}
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
	<%
		request.setCharacterEncoding("utf-8");
		String name = (String)session.getAttribute("ID");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
	%>
	<article>
	<div>
       <form method=post action="boardin.jsp" >
           <table class="table"  style ="width=600px; height=400px;" >
           <colgroup>
           	<col style="width:100px;" />
            <col />
           </colgroup>
             <tbody>
             <tr>
               <th class="emdfhr" colspan="2" >문의 내용</th>
             </tr>
             <tr>
                <th class="titleth" >제목</th>
                <td><p><%= title%></p></td>
             </tr>
              <tr>
                <th class="titleth" >이름</th>
                <td><p><%= name%></p></td>
             </tr>          
             <tr>
                <th class="contentth" >내용</th>
                <td><p><%= content%></p></td>
             </tr>
             </tbody>
           </table>
           <div class="btndiv" >
              <input class="btn" type=button value="이전" OnClick="window.location='page_board.jsp'">
           </div>
       </form>
    </div>
	</article>	
	</div>
</body>
</html>