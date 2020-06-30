<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "QnAreadView?qa_seq=${update.qa_seq}"
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
	
		<div id="root">
			<header>
				<h1 style="text-align: center; padding-top: 30px;"> 게시판 수정 페이지</h1>
			</header>
			
			<section id="container" style="padding-top: 30px;">
				<form name="updateForm" role="form" method="post" action="update">
					<input type="hidden" name="qa_seq" value="${update.qa_seq}" readonly="readonly"/>
					<table class="table">
						<tbody>
							<tr>
								<th style="text-align: center;">
									<label for="qa_category">카테고리</label>
								</th>
								<td>
									<select name="qa_category" id="qa_category">
										<option value="상품문의">상품문의
										<option value="배송문의">배송문의
										<option value="교환/환불문의">교환/환불문의
										<option value="취소문의">취소문의
									</select>				
								</td>
							</tr>	
							<tr>
								<th style="text-align: center;">
									<label for="qa_subject">제목</label>
								</th>
								<td>
									<input type="text" id="qa_subject" name="qa_subject" value="${update.qa_subject}">
								</td>
							</tr>	
							<tr>
								<th style="text-align: center;">
									<label for="qa_content">내용</label>
								</th>
								<td>
									<textarea id="qa_content" name="qa_content" rows="10" cols="100" style="resize: none"><c:out value="${update.qa_content}"/></textarea>
								</td>
							</tr>
							<tr>
								<th style="text-align: center;">
									<label for="user_id">작성자</label>
								</th>
								<td>
									<input type="text" id="user_id" name="user_id" value="${update.user_id}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th style="text-align: center;">
									<label for="qa_pwd">비밀번호</label>
								</th>
								<td>
									<input type="password" id="qa_pwd" name="qa_pwd" value="${update.qa_pwd}" />
								</td>
							</tr>
							<tr>
								<th style="text-align: center;">
									<label for="regdate">작성날짜</label>
													
								</th>
								<td>
									<fmt:formatDate value="${update.qa_logtime}" pattern="yyyy-MM-dd"/>	
								</td>
							</tr>		
						</tbody>			
					</table>
					<div style="text-align: center;">
						<button type="submit" class="update_btn" style="width: 100px; background-color:  #00D8FF; border: none; color:#fff;
						padding: 8px 0;text-align: center; text-decoration: none; display: inline-block; font-size: 15px; margin: 4px; cursor: pointer;
    					border-radius:10px;">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" class="cancel_btn" style="width: 100px; background-color:  #ED0000; border: none; color:#fff;
						padding: 8px 0;text-align: center; text-decoration: none; display: inline-block; font-size: 15px; margin: 4px; cursor: pointer;
    					border-radius:10px;">취소</button>
					</div>
				</form>
			</section>
			
		</div>
		
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