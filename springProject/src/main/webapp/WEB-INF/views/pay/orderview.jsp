<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <title>Insert title here</title>

  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	if(${orderview.product_stock} <= 0){
		alert('재고량이 없어 결제 하실수 없습니다');
		location.href="home";
	} 
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<body >
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
  <p>
<p>
<p>
<form name="order" method="post" action="Saveorders" >

<h3 style="text-align: center;">주문 정보</h3>
   <br>
   <table class="table" >
	<tr>
		<th style="text-align: center;">상품 명 </th>
		<td >
			<input type="text" value="${orderview.product_name_title}"  readonly="readonly" name="product_name_title" 
			style="text-align: center; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"> <br>
		</td>		
	</tr>
	<tr>
	<td style="text-align: center; padding-top: 100px;">상 품 이 미 지 </td>
	<td > <img src="<spring:url value='/imgUpload/'/>${orderview.product_name_image}" style="width: 200px; height: 150px;"/></td>
	</tr>
	<tr>
		<th style="text-align: center;">가 격 </th>
		<td > <input type="text" value="${orderview.product_name_price}" id="product_name_price" readonly="readonly" name="product_name_price" 
		style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: right;">원</td>
	</tr>
	<tr>
		<th style="text-align: center;">수량 </th>
		<td ><input type="number" class="numBox" name="product_count"  id="count" value="${count}" readonly="readonly"
		 style="text-align: center; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: right;"/>개 </td>
	</tr>
	<tr>
		<th style="text-align: center;">총 금액 </th>
		<td > <input type="number" class="sumprice"  readonly="readonly" name="product_sumprice" id="sumprice" value="${sum}"
		 style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: right;"/>원</td>
	</tr>
</table>
<h3 style="text-align: center;">배송 정보</h3><br>
 <table class="table">
	<tr>
		<th style="text-align: center; width: 670px;">주문 하시는 분 </th>
		<td >
			<input type="text" value="${id}"  readonly="readonly" name="id"
			 style=" border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">  
			
		</td>		
	</tr>
	<tr>
	<th style="text-align: center;">이 메 일  </th>
	<td> <input type="text" name="email" style="width: 300px;"></td>
	</tr>
	<tr>
		<th style="text-align: center;">주 소  </th>
		<td > <input type="text" name="addr" id="sample6_postcode" style="width: 100px;"> - <input type="button" class="post1" value="조회" onclick="sample6_execDaumPostcode()"  >	<p>	<p>	<p>
 <input type="text" data-rule-required="true" placeholder="주소" maxlength="11" name="addr1" id="sample6_address" style="width: 600px;"><p>
   <input type="text" placeholder="상세주소"  name="addr2" id="sample6_detailAddress" style="width: 600px;"><p>
     <input type="text"  class="post2" data-rule-required="true" placeholder="참고항목" maxlength="11"  id="sample6_extraAddress" style="width: 600px;"><p>
	</tr>
	<tr>
		<th style="text-align: center;">휴대 전화  </th>
		<td ><input type="text" name="tel"/> </td>
	</tr>
	<tr>
		<th style="text-align: center;">결제 금액 </th>
		<td > <input type="number" class="sumprice"  readonly="readonly" name="product_sumprice" id="sumprice" value="${sum}"
		 style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;  text-align: right;"/> 원</td>
	</tr>
</table>
<div style="text-align: center;"><input type="submit" value="결제하기" class="button" >&nbsp;&nbsp;&nbsp;
<input type="button" value="취소" onclick="history.go(-1)" class="button1"></div><p><p><p><p><p>
</form>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
<script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>