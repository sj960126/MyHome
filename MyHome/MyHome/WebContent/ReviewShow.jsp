<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import ="myhomereal.*" %>
        <%@ page import ="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
    
    
</style>

<script type="text/javascript">
$('#star_grade a').click(function(){
    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    return false;
});
</script>
<body>
<div class="review">
         <p>Review</p>
         <form action="ReviewAdd.jsp" method="post">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">               
               <tbody>
                   <tr>
                   <th>제목</th>
                     <td>
                        <input type ="text" name="id" >
                     </td>
                     
                     
                     <th>작성자</th>
                       <td>
                        <input type ="text" name="name">
                     </td>
                     <td>
	                     <p id="star_grade">
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <a href="#">★</a>
						</p>
					</td>	
                  </tr>               
                  <tr >
                     <td colspan ="4">
                        <textarea placeholder="글 내용" name="con" style>
                     </textarea>
                     </td>
                  </tr>
               </tbody>
            </table>
            <input type="submit" value="글쓰기" />
         </form>      
      </div>


        <%
        
	MyHomeRealDAO dao = new MyHomeRealDAOImpl();
		List<MyHomeReviewVO> list = dao.getList3();
		for(MyHomeReviewVO board : list) {			
			out.println("<table border=\"1px\";  style=\"height:180px;text-align: center; margin-bottom : 2%;\"><tr width: 100%; height: 50px;><td width: 20%;height: 50px;>"+board.getUserId()+"</td>");
			out.println("<td width: 50%;>"+board.getUserName()+"</td>");
			out.println("<td width: 30%;>"+board.getSysdate()+"</td></tr>");			
			out.println("<tr><td colspan='3'; style=\"height: 130px;\" >" +board.getContent()+ "</td></tr></table>");			
		}
%>



</body>
</html>