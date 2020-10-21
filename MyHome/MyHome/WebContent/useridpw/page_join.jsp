<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="page_join.css" rel="stylesheet"/>
<title>나만의집 ::: 회원가입</title>
<script>
var number = Math.floor((Math.random()*10000)+1000);
function passcheck(){
    var loginForm = document.form1;
    var userId = form1.id.value;
    var password = form1.pw.value;
    var userName = form1.name.value;
    var userEmail = form1.email.value;
    var userAddress = form1.address.value;
    var userPhone = form1.phone.value;
    var tos = document.getElementsByName("TOS");
    
    if(!password || !userId){
    	alert("입력 안 한 항목이 있습니다.");
    }
    else if(tos[0].checked == false){
    	alert("이용약관을 읽어주세요.");
    }
    else{
    	window.location.href="join.jsp?id=" + userId + "&pw="+ password +"&name=" + userName +"&email=" + userEmail+"&address="+userAddress+"&phone=" +userPhone;
    }
}

function checkhan(e) {
    if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode>=65 && e.keyCode<=90) || (e.keyCode>=97 && e.keyCode<=122)||e.keyCode==8||e.keyCode==9){
        return true;
    }
    else{
        alert("영문, 숫자만 사용하세요.");
        return false;
    }
}

function checkNum(e) {        
    if((e.keyCode >= 48) && (e.keyCode <= 57) ||e.keyCode==8||e.keyCode==9){
        return true;
    }
    else{
        alert("숫자만 입력하세요.");
        return false;
    }
}

function phonecheck(){
   alert(document.getElementById("phonetxt").value + "로 인증번호를 보냈습니다.")
   alert("[인증번호] "+number);
}

</script>
</head>
<body>
    <div id ="joinwrap">
    <form name= "form1"action ="join.jsp" method ="post">
        <table>
            <tr><th style="padding-bottom: 2%;">나만의집</th></tr>
            <tr><th style="font-size: 15px; padding-bottom: 5%;">회원정보 입력</th></tr>
            <tr><th class ="menu">이용약관</th></tr>
            <tr><td><textarea> 여러분을 환영합니다. 나만의집(이하 '서비스')을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 나만의집을 제공하는 나만의집 조원들과 이를 이용하는 나만의집 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 나만의집을 이용하시거나 나만의집 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 나만의집을 다양하게 둘러보세요.</textarea></td></tr>
            <tr><td><input type="radio" name="TOS"> 동의합니다. (필수)</td></tr>
            <tr><th class ="menu">ID</th></tr>
            <tr><td><input type="text" class="text" onkeydown="checkhan(event)" id = "id" name = "id"></td></tr>
            <tr><th class ="menu">비밀번호</th></tr>
            <tr><td><input type="password" id="pass" class="text" name= "pw"></td></tr>
            <tr><th class ="menu">비밀번호 확인</th></tr>
            <tr><td><input type="password" id="passch" class="text" ></td></tr>
            <tr><th class ="menu">이름</th></tr>
            <tr><td><input type="text" class="text" id ="name" name ="name"></td></tr>
            <tr><th class ="menu">이메일</th></tr>
            <tr><td><input type="text" class="text" id ="email" name ="email"></td></tr>
			<tr><th class ="menu">주소</th></tr>
            <tr><td><input type="text" class="text" id = "address"  name ="address"></td></tr>
            <tr><th class ="menu">휴대전화</th></tr>
            <tr>
               <td style="margin-right: 10%;"><input type ="text" id="phonetxt" name ="phone" placeholder="휴대폰번호를 입력하세요." maxlength="11" onkeydown="checkNum(event)">
                  <input type="button" id = "checkbtn" value="인증번호 전송" class="phone_input" onclick = "phonecheck()"></td>
            </tr>
            <tr><td style="padding-bottom: 5%;"><input type ="text" id="checktxt" placeholder="인증번호를 입력하세요." maxlength="5" onkeydown="checkNum(event)"></td></tr>
          <tr><td><input type="button" id="joinbtn" onclick="passcheck()" value="JOIN" ></td></tr>
        </table>
    </form>
    </div>
</body>
</html>