<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import ="myhomereal.*" %>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매</title>
	<link rel="stylesheet" href="css/buy_product.css" />
<style>
body{
height :auto;
}
textarea		{ width:1060px;  height:100px;      resize:none;}
.bakettable	{  width: 100%;    text-align:center;}
.bakettable  td,tr,th {  border-bottom: 1px solid #444444; padding: 10px;  text-align:center;} // 전체 테두리 영향
.reviewtable			{border:1px; width:1050px; height:180px; text-align: center; }
.showreview 			{border:1px; width:1050px; height:180px; text-align: center;}
.showreview  td,tr,th {  border-bottom: 1px solid #444444; padding: 10px;  text-align:center;}
.reviewtable td text    {width:100%; colspan='5';}

</style>	
</head>

<body>
<% String name = (String)session.getAttribute("ID"); %>
	<div class="wrap">
		<span class="logo"><a href="index.jsp"><img src="img/sub_logo.png"></a></span>
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
	
	<article>
		<div class="line"></div>
		<table>
			<tr>
				<td width="320"height="320"><img src="img/1.JPG" width="300"height="300"></td>
				<td>
	<form method="post" action="BasketAdd.jsp">
	
	
   <table class="bakettable">
      <tr>
         <th>카테고리</th>
            <td>가구<input type="hidden" name="category" id ="category" value="가구"></td>            
      </tr>      
      <tr>      
         <th>상품명</th>
            <td>침대에오<input type="hidden" name="name" id= "name" value="침대에오"></td>            
      </tr>      
      <tr>      
         <th>가격</th>
            <td>         
               <select name="price">
                  <option value="400">싱글형-400</option>
                  <option value="500">벙글형-500</option>               
               </select>
            </td>
      </tr>
      <tr>            
         <th>주문</th>
            <td>                           
               <input type="submit" value="장바구니 추가">          
                 
            </td>
      </tr>   
   </table>
   </form>
  		
	 <button onclick="location='BasketShow.jsp'">장바구니 보기</button>    
			</td>
		</tr>
	
				<tr>
				<td colspan="2"><img src="img/fu1.JPG" width="1000px"></td>
			</tr>
			<tr>
				<td colspan="2"><img src="img/fu2.JPG" width="1000px"></td>
			</tr>
			<tr>
				<td colspan="2"><img src="img/fu3.JPG" width="1000px"></td>
			</tr>
		</table>
		
			
		<div class="review">
         <p>Review</p>
         
         <form action="ReviewAdd.jsp" method="post">
            <table class="reviewtable" style="text-align: center; border: 1px solid #dddddd">               
               <tbody>
               
                   <tr>                   
                   <th>제목</th>                   
                     <td>
                        <input type ="text" name="id" >
                     </td>                       
                        <th>작성자</th>                        
                     <td>
                        <h5><%= name%></h5>
                     </td>
                   </tr>
                  
                                 
                  <tr >
                     <td colspan ="4">
                        <textarea placeholder="글 내용" name="con"></textarea>
                     </td>
                  </tr>
                  <tr>
                  	<td  colspan='5'; >
                  	 <input type="submit" value="글쓰기" style="width:100%; height:100%;">
                	 </td>
                  </tr>                  
               </tbody>
            </table>           
         </form>      
         </div>	
         <div>
         	<table class="showreview">
			<%        
				MyHomeRealDAO dao = new MyHomeRealDAOImpl();
					List<MyHomeReviewVO> list = dao.getList3();
					for(MyHomeReviewVO board : list) {			
						out.println("<tr><td>"+"제목"+"</td>");
						out.println("<td>"+board.getUserId()+"</td>");
						out.println("<td>"+"작성자"+"</td>");
						out.println("<td>"+board.getUserName()+"</td>");
						out.println("<td>"+board.getSysdate()+"</td></tr>");			
						out.println("<tr><td colspan='5'; style=\"height: 70px;\" >" +board.getContent()+ "</td></tr>");			
					}
			%>
         	</table>         
         </div>
	</article>
	</div>
	
</body>
</html>