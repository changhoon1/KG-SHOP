<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	
</script>

		<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}

.button {
	width: 100px;
	background-color: #5CD1E5;
	border: none;
	color: #fff;
	padding: 8px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 10px;
}
</style>
		
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
            <a class="nav-link" href="reviewPage">리뷰게시판</a>
          </li>
          
         <li class="nav-item">
         <c:choose>
          	  <c:when test="${id eq 'system'}"></c:when>
          	  <c:when test="${empty id }"></c:when>
            <c:otherwise> <a class="nav-link" href="shoppingcart?user_id=${id}">장바구니</a></c:otherwise>
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
  </div>

	<div class="container" style="margin-top: 40px;">
		<h4 style="padding-left:20px;">Review</h4>
		<section class="container">
		<form role="form" method="get">
			<table class="table table-hover">
				<tr><th>평점(5/5)</th><th>번호</th><th>상품</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
				<c:forEach items="${list}" var = "list">
					<tr>
						<td><c:out value="${list.review_score}" /></td>
						<td><c:out value="${list.review_seq}" /></td>
						
						<!-- 해당상품에 대한 이미지, 크기 작게 -->
						<td>
						<img style="width: 50px; height: 50px;" name="review_product_image" src="<spring:url value='/imgUpload/'/>${list.review_product_image}" >
						</td>
						
						<td>
						<c:choose>
						<c:when test="${empty id}"><a href="reviewWrite"><c:out value="${list.review_subject}" /></a></c:when>
						<c:otherwise>
							<a href="reviewReadView?review_seq=${list.review_seq}
							&page=${scri.page}
							&perPageNum=${scri.perPageNum}">
							<c:out value="${list.review_subject}" /></a>
						</c:otherwise>
						</c:choose>
						</td>
						<td><c:out value="${list.review_user_id}" /></td>
						<td><fmt:formatDate value="${list.review_logtime}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
				    	
		<div class="col-md-offset-3"></div>
		  <ul class="pagination">
		    <c:if test="${pageMaker.prev}">
		    	<li class="page-item"><a class="page-link" href="QnA${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
			
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}"/>>
		    	<a class="page-link" href="QnA${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li class="page-item"><a class="page-link" href="QnA${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
		  </ul>
		</form>
		<br>
		
 </section>
</div>
 <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>