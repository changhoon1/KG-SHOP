<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	.button{
	width: 100px;
	
	background-color:  #00D8FF;

    border: none;

    color:#fff;

    padding: 8px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
    border-radius:10px;
	}
	.button1 {
	width: 100px;
	
	background-color:  #ED0000;

    border: none;

    color:#fff;

    padding: 8px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
    border-radius:10px;
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="home">KG SHOP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
          <c:choose>
               <c:when test="${id eq 'system'}"><a class="nav-link" href="#" >${id }님 환영합니다 
              <span class="sr-only">(current)</span></a>
              </c:when>
              <c:when test="${empty id }"> <a class="nav-link" href="home">홈
              <span class="sr-only">(current)</span>
              </a></c:when>
               <c:when test="${id eq id}"><a class="nav-link" href="#" >${id }님 환영합니다 
              <span class="sr-only">(current)</span>
              </a>
              </c:when>       
          </c:choose>
           
            
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QnA">Q&A게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">리뷰게시판</a>
          </li>
          
         <li class="nav-item">
         <c:choose>
               <c:when test="${id eq 'system'}"></c:when>
               <c:when test="${empty id }"></c:when>
            <c:otherwise> <a class="nav-link" href="shoppingcart">장바구니</a></c:otherwise>
             </c:choose>
          </li>
            
           <li class="nav-item">

   
             <c:choose>
               <c:when test="${id eq 'system'}"><a class="nav-link" href="myPage">관리자페이지</a></c:when>
                <c:when test="${empty id }"> 
               <a class="nav-link" href="bootMember">회원가입</a>
                </c:when>
               <c:otherwise><a class="nav-link" href="myPage">마이페이지</a></c:otherwise>    
            </c:choose>
          
          <li class="nav-item">
             <c:choose>
                  <c:when test="${empty id }"> <a class="nav-link" href="bootlogin">로그인</a> </c:when>
                  <c:otherwise>  <a class="nav-link" href="logout">로그아웃</a></c:otherwise>       
            </c:choose>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
  <p>
  <p>
  <p>
  <p>
  <p>
  <p>
  <p>
  <p>
  <h1 style="text-align: center;">수정 페이지</h1>
    <p>
  <p>
  <p>
  <p>
  <p>
  <p>
  <p>
  <p>
<form action="Savebanner?banner_no=${banner_no}" enctype="multipart/form-data" method="post">
<table class="table">
	<tr>
		<th> 카테고리 </th>
		<td>
		<select name="banner_category" id="banner_category" >
             <option value="notebook">노트북</option>
             <option value="computer">컴퓨터</option>
               <option value="moniter">모니터</option>
               <option value="mouse">마우스</option>
               <option value="speaker">스피커</option>
               <option value="graphiccard">그래픽카드</option>
               <option value="cpu">CPU</option>
               <option value="mainboard">메인보드</option>
               <option value="hdd">하드디스크</option>
               <option value="ram">램</option>
               <option value="sdd">SDD</option>
               <option value="ram">RAM</option>
      </select><br>
		</td>
	</tr>
	<tr>
		<th>상품 이미지 등록</th><td><input type="file" name="file" id="banner_image"> </td>
	</tr>
	<tr>
		<th>이미지 미리보기</th>
		<td>
		<div class="select_img"><img src="" /></div>
			<script>
			  $("#banner_image").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
 				</script>  
		</td>
	</tr>
</table> 
   <div style="text-align: center;"><input type="submit" value="수 정" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="취 소" onclick="history.back()" class="button1"></div>
</form> 
 <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>