<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
   <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "QnAreadView?qa_seq=${replyUpdate.qa_seq}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
		})
		
	</script>
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
            <a class="nav-link" href="reviewPage">리뷰게시판</a>
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
		<div id="root" style="text-align: cetner; padding-top: 30px;">
			
				<h1 style="text-align: cetner;"> 게시판</h1>
	
			<section id="container" style="padding-top: 30px;">
				<form name="updateForm" role="form" method="post" action="replyUpdate">
					<input type="hidden" name="qa_seq" value="${replyUpdate.qa_seq}" readonly="readonly"/>
					<input type="hidden" id="qa_reply_seq" name="qa_reply_seq" value="${replyUpdate.qa_reply_seq}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table class="table" border="1" style="text-align: cetner;">
						<tbody>
							<tr>
								<td>
									<label for="qa_reply_content">댓글 내용</label>
								</td>
								<td>
									<input type="text" id="qa_reply_content" name="qa_reply_content" value="${replyUpdate.qa_reply_content}"/>
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div style="text-align: cetner;">
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
		
		</div>
	</body>
</html>