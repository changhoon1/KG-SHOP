<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		})
		
		// 삭제
		$(".delete_btn").on("click", function(){
			formObj.attr("action", "delete");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		// 취소
		$(".list_btn").on("click", function(){
			location.href = "QnA?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		//댓글 작성
		$(".replyWriteBtn").on("click", function(){
		   var formObj = $("form[name='replyForm']");
		   formObj.attr("action", "replyWrite");
		   formObj.submit();
		});
		
		//수정 버튼을 클릭했을 때 url주소가 게시판
		//qa_seq, page, perPageNum, searchType, keyword 그리고 댓글번호인 rno가 들어가 있는것이 보입니다. 
		//여기서 $(this).attr("data-qa_reply_seq")는 클릭 이벤트가 발생한 수정 버튼의 data-qa_reply_seq값을 가져오겠다는 말이에요.
		
		//댓글 수정 View
		$(".replyUpdateBtn").on("click", function(){
			location.href = "replyUpdateView?qa_seq=${read.qa_seq}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&qa_reply_seq="+$(this).attr("data-qa_reply_seq");
		});
				
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "replyDeleteView?qa_seq=${read.qa_seq}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&qa_reply_seq="+$(this).attr("data-qa_reply_seq");
		});
		
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
		
		<h1 style="text-align: center; padding-top: 30px;">게시글 조회</h1>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="qa_seq" name="qa_seq" value="${read.qa_seq}" />
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		</form>
		<table class="table" style="margin-top: 30px;">
			<tr>
				<th style=" text-align: center; width: 200px;">글 번호</th>
				<td><input type="text" id="qa_seq" name="qa_seq" value="${read.qa_seq}" readonly="readonly" style="margin-left: 15px;"/></td>
			</tr>
			<tr>
				<th style="text-align: center;">카테고리</th>
				<td><input type="text" id="qa_category" name="qa_category" value="${read.qa_category}" readonly="readonly" style="margin-left: 15px;"/></td>
			</tr>
			<tr>
				<th style="text-align: center;">제목</th>
				<td><input type="text" id="qa_subject" name="qa_subject" value="${read.qa_subject}" readonly="readonly" style="margin-left: 15px;"/></td>
			</tr>
			<tr>
				<th style="text-align: center;">내용</th>
				<td><div class="col-sm-8">
						<textarea id="qa_content" name="qa_content" readonly="readonly" 
						rows="10" cols="100" style="resize: none"><c:out value="${read.qa_content}" /></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">작성자</th>
				<td><input type="text" id="user_id" name="user_id" value="${read.user_id}" readonly="readonly" style="margin-left: 15px;"/></td>
			</tr>
			<tr>
				<th style="text-align: center;">작성날짜</th>
				<td><fmt:formatDate value="${read.qa_logtime}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</table>	
				
					<div style="text-align: center;">
					<c:choose>
		               <c:when test="${id eq 'system' }">
		               
		               <button type="submit" class="update_btn btn btn-default">수정</button>
		               <button type="submit" class="list_btn btn btn-default">목록</button>   
		                  <button type="submit" class="delete_btn btn btn-warning">삭제</button>
		               </c:when>
		               <c:when test="${id ne read.user_id}">
		               <button type="submit" class="list_btn btn btn-default">목록</button>   
		               </c:when>
		               <c:otherwise>
		               <button type="submit" class="update_btn btn btn-default">수정</button>
		               <button type="submit" class="list_btn btn btn-default">목록</button>   
		                  <button type="submit" class="delete_btn btn btn-warning">삭제</button>
	               	</c:otherwise>
               		</c:choose>
					</div>
	
	
		<h4 class="col-sm-offset-4 col-sm-8">댓글</h4>
				<table class="table" ><!-- 댓글 -->			
				    <c:forEach items="${replyList}" var="replyList">
				    <tr>
				    <th style="width: 200px;text-align: center;">작성자</th>
				    <td><input type="text" value="${replyList.qa_reply_user_id}" readonly="readonly"></td>	
					</tr>   	
				    <tr>
				    <th style="text-align: center;">작성 날짜</th>
				    <td><fmt:formatDate value="${replyList.qa_reply_logtime}" pattern="yyyy-MM-dd" /></td>	
					</tr> 
					<tr>  	
				    <th style="text-align: center;">내용</th>
				    <td>  <textarea readonly="readonly" 
								rows="5" cols="50" style="resize: none">${replyList.qa_reply_content}</textarea>
					</td>	
					</tr>   	
					<tr>
					<td></td>
						<td>
						<button type="button" class="replyUpdateBtn btn btn-default" data-qa_reply_seq="${replyList.qa_reply_seq}">수정</button>
						<button type="button" class="replyDeleteBtn btn btn-warning" data-qa_reply_seq="${replyList.qa_reply_seq}">삭제</button>				  	 
						</td>
					</tr>   			       
								
				    </c:forEach>   
				</table>
				<!-- 댓글작성폼 -->
				<form name="replyForm" method="post">
				  <input type="hidden" id="qa_seq" name="qa_seq" value="${read.qa_seq}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				  <table style="padding-top: 30px;" class="table">
				  	<c:choose>
				  	<c:when test="${id eq read.user_id}"></c:when>
				  	<c:otherwise>
				  	<tr>
				  		<th style="width: 200px;text-align: center;">댓글 작성자</th>
				  		<td><input type="text" id="qa_reply_user_id" name="qa_reply_user_id" readonly="readonly" value="관리자"/></td>
				  	</tr>
				  	<tr>
				  		<th style="text-align: center;">댓글 내용</th>
				  		<td><textarea id="qa_reply_content" name="qa_reply_content" rows="5" cols="50" style="resize: none"></textarea></td>
				  	</tr>
					<tr>
						<td></td>
						<td><button type="button" class="replyWriteBtn">작성</button></td>
					</tr>							 	 
				 	 </c:otherwise>
				 	 </c:choose>
				  </table>
		  
				</form>
				
				
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