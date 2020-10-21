<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="myhomereal.*"  %>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <link href="page_login.css" rel="stylesheet"/>
  <title>나만의집 ::: 로그인</title>
    <script>
function log(){
    var loginForm = document.login_form;
    var userId = login_form.id_txt.value;
    var password = login_form.pass_txt.value;
    login_form.submit();
}
	</script>
 </head>
 
 <body>
    <div id ="loginWrap">
	<form  action= "login.jsp" name="login_form" method ="post"> 
      <table>
            <tr><th>LOGIN</th></tr>
         <tr>
            <td><input type="text" name ="id_txt" placeholder="아이디" class= "text"></td>
        </tr> 
        <tr>
            <td><input type="password" name ="pass_txt" placeholder="비밀번호" class= "text"></td>
        </tr>
        <tr><td><input type="button" value ="LOGIN" id = "loginbtn" onclick = "log()">
     	</td></tr>
        <tr><td><input type="button" value ="JOIN US" id ="joinbtn" onclick="location.href='page_join_menu.jsp'"></td></tr>
        <tr><td><%@ include file="kakaobtn.jsp"%></td></tr>
		<tr><td id = "finduser"><a href="page_findUser.jsp" >일반회원 아이디/비밀번호찾기</a></td></tr>
        </table>
     </form>
     </div>
</body>
</html>