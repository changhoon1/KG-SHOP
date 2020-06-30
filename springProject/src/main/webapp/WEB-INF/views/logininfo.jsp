<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>로그인 성공입니다</h1>
  <%
  String name ="";
  name = (String)session.getAttribute("usernickname");
  String email ="";
  email = (String)session.getAttribute("useremail");
  System.out.println("로그인 성공 페이지");
  System.out.println("닉네임 : " + name);
  System.out.println("이메일 : " + email);
  %>
	 <a href = "kakaologout">로그아웃</a><br>

</body>
</html>