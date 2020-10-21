<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <link href="page_findUser.css" rel="stylesheet"/>
  <title>나만의집 ::: 회원정보 찾기</title>
 </head>
 <body>
    <div id ="findwrap">
	<form action = "findID.jsp" id ="findID"> 
      <table>
          <tr><th>아이디 찾기</th></tr>
          <tr><td class="ment">회원가입 시 입력한 이름 + 이메일로 아이디를 확인할 수 있습니다.</td></tr>
         <tr>
            <td><input type="text" name ="idname" placeholder="이름" class= "text"></td>
        </tr> 
        <tr>
            <td><input type="text" name ="idemail" placeholder="이메일" class= "text"></td>
        </tr>
        <tr><td style="padding-top: 3%;"><input type="submit" value ="FIND ID" id ="idbtn"></td></tr>
        <tr><td><input type="button" value ="LOGIN" id = "loginbtn" onclick="location.href='page_login.jsp'"></td></tr>
        </table>
     </form>
     
     <form action = "findPw.jsp" id ="findPW">
        <table>
            <tr><th>비밀번호 발급</th></tr>
            <tr><td class="ment">가입한 아이디 + 이메일을 통해 비밀번호를 알려드립니다. 로그인 후 회원정보 창에서 변경하시길 바랍니다.</td></tr>
           <tr>
              <td><input type="text" name ="pwid" placeholder="아이디" class= "text"></td>
          </tr> 
          <tr>
              <td><input type="text" name ="pwemail" placeholder="이메일" class= "text"></td>
          </tr>
          <tr><td style="padding-top: 3%;"><input type="submit" value ="FIND PW" id ="pwbtn"></td></tr>
          <tr><td><input type="button" value ="LOGIN" id = "loginbtn" onclick="location.href='page_login.jsp'"></td></tr>
          </table>
     </form>
     </div>
</body>
</html>