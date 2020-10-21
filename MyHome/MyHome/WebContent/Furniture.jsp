<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 집</title>
	<link rel="stylesheet" href="css/sub.css" />	
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
	<article>
		<h2>Best Choice</h2>
		<div class ="product">
			<ul>
			<li><div class="best">
			<a href="buy_product.jsp"><img src="img/1.JPG" width ="200" height="230"></a>
			<div class="title">스텐다드 전신거울</div>
			<div class="title">28,000원</div>
			<div class="title"><img src="img/btn.JPG" width="60"></div>
			</div>
			</li>
			
			<li>
			<div class="best">
			<img src="img/2.JPG" width ="200" height="230">
			<div class="title">마리 3인쇼파</div>
			<div class="title">47,000원</div>
			</div>
			</li>
			
			<li><div class="best">
			<img src="img/3.JPG" width ="200" height="230">
			<div class="title">모이 화장대서랍 체스트 2color</div>
			<div class="title">42,000원</div>
			<div class="title"><img src="img/btn.JPG" width="60"></div>
			</div>
			</li>
			
			<li>
			<div class="best">
			<img src="img/4.JPG" width ="200" height="230">
			<div class="title">아바 노트북 책상</div>
			<div class="title">6,2000원</div>
			</div>
			</li>
			</ul>
			
			<ul>
			<li><div class="best">
			<img src="img/5.JPG" width ="200" height="230">
			<div class="title">상일 드레스룸</div>
			<div class="title">82,000원</div>
			<div class="title"><img src="img/btn.JPG" width="60"></div>
			</div>
			</li>
			
			<li>
			<div class="best">
			<img src="img/6.JPG" width ="200" height="230">
			<div class="title">ZINUS 퀸 침대</div>
			<div class="title">20,320원</div>
			<div class="title"><img src="img/btn.JPG" width="60"></div>
			</div>
			</li>
			
			<li><div class="best">
			<img src="img/7.JPG" width ="200" height="230">
			<div class="title">수납 침대</div>
			<div class="title">18,320</div>
			<div class="title"><img src="img/btn.JPG" width="60"></div>
			</div>
			</li>
			
			<li>
			<div class="best">
			<img src="img/8.JPG" width ="200" height="230">
			<div class="title">Munster 침대</div>
			<div class="title">15,320원</div>
			<div class="title"><img src="img/btn.JPG" width="60"></div>
			</div>
			</li>
			</ul>
			
			<ul>
			<li><div class="best">
			<img src="img/9.JPG" width ="200" height="230">
			<div class="title">레이디 3인용 쇼파</div>
			<div class="title">12,320원</div>
			</div>
			</li>
			
			<li>
			<div class="best">
			<img src="img/10.JPG" width ="200" height="230">
			<div class="title">극세사 레이디 매트릭스</div>
			<div class="title">8,470원</div>
			</div>
			</li>

			</ul>
		</div>
	</article>
	
	</div>
</body>
</html>