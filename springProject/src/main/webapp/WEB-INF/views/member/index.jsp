<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
  <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <title>Login Demo - Kakao JavaScript SDK</title>



    <script src="./resources/kakao.js"></script> 
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
               // 2)
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>




</head>
<body>

<a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout"></a>
    <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
         Kakao.init('c30a16b5e38c870bb55d4fe1804b17ad');    
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    </script>

 <!-- 
<center>
<c:choose>
<c:when test="${sessionId != null}">
<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
<h3>'${sessionId}' 님 환영합니다! </h3>
<h3><a href="logout">로그아웃</a></h3>
</c:when>
<c:otherwise>
<form action="login.userdo" method="post" name="frm" style="width:470px;">
<h2>로그인</h2>
<input type="text" name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}"> <br>
<input type="password" id="pwd" name="pwd" class="w3-input w3-border" placeholder="비밀번호" > <br>
<input type="submit" value="로그인" onclick="#"> <br>
</form>
<br>
 네이버 로그인 창으로 이동
<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<br>
</c:otherwise>
</c:choose>
</center>

 -->


</body>
</html>