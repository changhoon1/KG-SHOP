<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

 <!-- Navigation -->
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
              <c:when test="${empty id }"> <a class="nav-link" href="home">홈
              <span class="sr-only">(current)</span>
              </a></c:when>
               <c:when test="${id eq id}"><a class="nav-link" >${id }님 환영합니다 
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

	<div class="container" style="margin-top: 40px;">
		<h4 style="padding-left:20px;">Q&A</h4>
		<section class="container">
		<form role="form" method="get">
			<table class="table table-hover">
				<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
				<c:forEach items="${list}" var = "list">
					<tr>
						<td><c:out value="${list.qa_category}" /></td>
						<td><c:out value="${list.qa_seq}" /></td>
						
						<td>
						<c:choose>
                     <c:when test="${empty id}">
                     	<c:choose>
                       		<c:when test="${list.qa_state eq 1 }">
		                     	<a href="QnAwrite">
		                       		<c:out value="${list.qa_subject}" />
		                        </a>
		                        <font color="gray">(비밀번호가 설정된 글입니다.)</font> 
		                   	</c:when>
		                   	<c:otherwise>
                                 <a href="QnAwrite">
                                 	<c:out value="${list.qa_subject}" />
                                 </a>
                              </c:otherwise>
                           </c:choose>
		                   	
                     </c:when>
                     <c:when test="${not empty id}">
                           <c:choose>
                              <c:when test="${list.qa_state eq 1 }">
                                 <a href="QnAreadView?qa_seq=${list.qa_seq}
                                 &page=${scri.page}
                                 &perPageNum=${scri.perPageNum}
                                 &searchType=${scri.searchType}
                                 &keyword=${scri.keyword}">
                                 	<c:out value="${list.qa_subject}"/>
                                 </a>
                                 <font color="gray">(비밀번호가 설정된 글입니다.)</font>
                              </c:when>
                              <c:otherwise>
                                 <a href="QnAreadView?qa_seq=${list.qa_seq}
                                 &page=${scri.page}
                                 &perPageNum=${scri.perPageNum}
                                 &searchType=${scri.searchType}
                                 &keyword=${scri.keyword}">
                                 <c:out value="${list.qa_subject}"/>
                                 </a>
                              </c:otherwise>
                           </c:choose>
                     </c:when>
                  </c:choose>
                  </td>
						<td><c:out value="${list.user_id}" /></td>
						<td><fmt:formatDate value="${list.qa_logtime}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
			<div class="search row">
				<div class="col-xs-2 col-sm-2">
				    <select name="searchType" class="form-control">
				      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				    </select>
				</div>
				<div class="col-xs-3 col-sm-3">
					<div class="input-group">
				    	<input class="form-control" type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
				    	<span class="input-group-btn">
				    		<button class="btn btn-default" id="searchBtn" type="button">검색</button>
				    	</span>
					</div>
				</div>
				    	
			    <script>
			      $(function(){
			        $('#searchBtn').click(function() {
			          self.location = "QnA" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>
			 </div>
		
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
		<input type="button" value="글쓰기" onclick="location.href='QnAwrite'" >
 </section>
</div>
  <!-- Footer -->
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