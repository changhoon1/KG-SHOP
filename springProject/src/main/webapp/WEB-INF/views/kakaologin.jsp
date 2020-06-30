<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 카카오톡 로그인 <br>
 
 	<a href="kakaopay">결제하기</a>
 
 
 
        <a href = "https://kauth.kakao.com/oauth/authorize?client_id=c2205973abf3d4bbd2283090a123e0db&redirect_uri=http://localhost:9090/controller/oauth&response_type=code">
           <img src="<spring:url value='/imgUpload/'/>\imgUpload\kakao.png">
        </a>


</body>
</html>