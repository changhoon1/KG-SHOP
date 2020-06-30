<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Insert title here</title>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js">
</script>


<!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<script type="text/javascript">
$(function(){ 
   //전체선택 체크박스 클릭    
   $("#allCheck").click(function() { 
         if ($("#allCheck").prop("checked")) {
            $("input[type=checkbox]").prop("checked", true); 
         } else { 
            $("input[type=checkbox]").prop("checked", false);
         }
      })
   })
</script>

<script type="text/javascript">
	function replace(url) {
	    url= url.replace(/\+/g,"%2B");
	    console.log(url);
	 	location.href=url;   
	}
</script>

<style>

table.type08 {
	margin-left: auto; margin-right: auto;

    text-align: center;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    
}

table.type08 thead th {
    padding: 10px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: #dcdcd1;
}
table.type08 tbody th {
 
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #ececec;
}
table.type08 td {

    padding: 10px;
    vertical-align: center;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.button {

    width:100px;

    background-color: #FFBB00;

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

<h1 style="text-align: center; padding-top: 30px;">장바구니 페이지</h1>

<table class="type08" style="margin-top: 30px;">
   <tr>
      <th >번 호 </th>
            <th >이 미 지</th><th >상 품 명</th><th >가 격</th><th >수 량</th><th >합 계</th><th >결 제</th><th >삭 제</th>
   </tr>
   
   <c:forEach items="${shoppingcart}" var="shoppingcart" >
   <c:set var ="su" value="${su+1}"/>
   <tr>
      <td scope="row">${su}</td>
      <td scope="row"><img src="<spring:url value='/imgUpload/'/>${shoppingcart.product_name_image }"/></td>
      <td scope="row">${shoppingcart.product_name_title}</td>
      <td scope="row"><fmt:formatNumber value="${shoppingcart.product_name_price}" pattern="###,###,###"  />원</td>
      <td scope="row">${shoppingcart.product_count}</td>
      <td scope="row"><fmt:formatNumber value="${shoppingcart.product_name_price * shoppingcart.product_count}" pattern="###,###,###"  />원</td>
    	
      <td><a href="javascript:replace('orderview?product_name_title=${shoppingcart.product_name_title}&product_count=${shoppingcart.product_count}');">결제하기</a></td>
      <td><a href="javascript:replace('deletecart?product_name_title=${shoppingcart.product_name_title}');">삭제하기</a></td>
      	
     	
      

   </c:forEach>
   
</table> 
 <p>
  <p>
  <p>
 	  <div style="text-align: center;">
 	  <input type="button" value="홈으로" onclick="location.href='home'" class="button">
 	  <input type="button" value="이전" onclick="history.go(-1)" class="button">	  
 	  </div>
  <p>
  <p>
  <p> 
 <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
 
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 
</body>
</html>