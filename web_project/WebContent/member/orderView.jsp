<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
		
		a{
			text-decoration: none;
			color: black;
			font-family: 나눔고딕;
		}
		
		header a{
			font-family: Arial;
		}
		
		header a:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}
		
		nav{
			float: left;
			margin: 10px;
			font-family: 나눔고딕;
		}
		
		section{
			margin: 75px 325px 25px 100px;
			padding: 0px 100px;
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div{
			font-size: 12px;
			font-family: 나눔고딕;
		}
		
		input.black {
			font-size : 12px;
			width: 50px; 
			height: 35px; 
			text-align: center; 
			color: white;
			background-color: black;
			font-weight: bold;
			font-family: 나눔고딕;
		}
		
		input.white {
			font-size : 12px;
			width: 50px; 
			height: 35px; 
			text-align: center; 
			color: black;
			background-color: white;
			font-weight: bold;
			font-family: 나눔고딕;
		}
		
		input.text{
			letter-spacing: 1.5px;
			font-size: 15px;
			width: 150px; 
			height: 30px; 
			text-align: center; 
			background-color: white;
		}
		
		div.left{
			width: 90%;
			float: left;
			text-align: left;
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div.right{
			width: 10%;
			float: right;
			align: right;
			font-family: 나눔고딕;
		}
		
		div.left2{
			width: 20%;
			padding: 0 2% 0 0;
			float: left;
		}
		
		div.center{
			width: 60%;
			float: left;
		}
		
		div.right2{
			width: 15%;
			float: right;
			text-align:right;
		}
		
		button.black{
			color: white;
			background-color: black;
			width: 70%;
			height: 40px;
		}
		
		button.white{
			color: black;
			background-color: white;
			width: 70%;
			height: 40px;
		}
	</style>
</head>
<body>
<script type="text/javascript"> 
		window.name = "revie_parent";
	</script>
	<header>
	<h1 style="font-size: 50px;"><a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
	구매내역</h1>
	</header>

	<nav>
		<jsp:include page="../include/leftLayout.jsp" />
	</nav>

	<section>
	<b>구매내역</b>
	<hr width="100%">
	<div align="center">
		<br>
		<b>기간조회 :</b>
		
		<!-- 이 부분 ajax를 좀더 공부하고 와서 완성할 것 -->
		
		<c:set var="date_3" value="${date_3 }" />
		<c:set var="date_now" value="${date_now }" />
		<c:set var="mem" value="${memDTO }" />
		<c:set var="qList" value="${qaList }"/>
		
		<input type="button" value="3개월" class="black" />
		<input type="button" value="6개월" class="white" />
		<input type="text" value=${date_3 } class="text" />
		~
		<input type="text" value=${date_now } class="text" />
		<input type="button" value="조회" class="black" />
		<br> <br> <br>
	</div>
	<div>
		<c:set var="pList" value="${payList }" />
		<c:set var="a" value="0" />
		<c:set var="cancelList" value="${cancelList }" />
		<c:set var="reviewList" value="${reviewList }" />
		<c:forEach items="${pList }" var="pDTO">
			<c:set var="b" value="0" />
			<c:set var="c" value="0" />
			<c:if test="${pDTO.getOrderdate().substring(0,10) != a}">
				<hr>
				<b>${pDTO.getOrderdate().substring(0,10) }</b><br><br><br>
			</c:if>
			
			<div class="left2">
				<a><img src="<%=request.getContextPath() %>/upload/${pDTO.getPay_pimage() }"
					    width="100" height="100"></a>
			</div>
					
			<!-- ajax가 필요해 보인다. ajax로 jsp 페이지 안에서 dao 메서드를 연산이 가능한가를 알아봐야한다. -->
			<div class="center">
				<br>
				<b>${pDTO.getPname() } &nbsp;&nbsp;&nbsp; ${pDTO.getPqty() }매</b><br><br>
				<b><fmt:formatNumber value="${pDTO.getPrice() }" />원</b><br><br>
				구매완료
			</div>
					
			<div class="right2">
				<!-- 해당 제품에 대한 리뷰가 존재하면 내가 쓴 리뷰에 해당하는 별점이 보인다거나 하는 다른 것이 보이도록 할 예정인데,
					리뷰 테이블은 Pno를 컨퍼런스 값으로 가진다. 만약 다른 날 같은 제품을 구매했을 때 모든 같은 제품이 리뷰 처리 될 것 같아서
					orderNo 추가 하는거 이야기 해봐야 한다.-->
				
				<c:forEach items="${reviewList }" var="rDTO">
					<c:if test="${pDTO.getOrder_no() == rDTO.getOrderno_fk() }">
						<c:set var="star" value="${rDTO.getReview_rate() }" />
						별점:
						<c:forEach begin="1" end="5" var="i">
							<c:if test="${star >= 1 }">
								★
							</c:if>
							<c:if test="${star == 0.5 }">
								◐
							</c:if>
							<c:if test="${star <= 0}">
								☆
							</c:if>
							<c:set var="star" value="${star - 1 }" />
						</c:forEach>
						<br><br>
						<b><button class="white" 
						onclick="location.href='<%=request.getContextPath() %>/member_viewReview.do?num=${rDTO.getOrderno_fk() }'">
						내가 쓴 리뷰</button></b><br><br>
						<c:set var="c" value="1" />
					</c:if>
				</c:forEach>
				<c:if test="${c == 0 }">
				
					<a href="<%=request.getContextPath()%>/review_write.do?no=${pDTO.getOrder_no()}" 
			onclick="window.open( this.href, '_blank', 'width=470,height=490, scrollbars=yes,directories=no'); return false ">리뷰쓰기</a><br><br>
				</c:if>
				
				<c:forEach items="${cancelList }" var="qaDTO">
					<c:if test="${pDTO.getOrder_no() == qaDTO.getQa_orderno()}">
						반품/취소 처리중
						<c:set var="b" value="1" />
					</c:if>
				</c:forEach>
				<c:if test="${b == 0 }">
					<b><button class="black" onclick="location.href='<%=request.getContextPath() %>/member_orderCancel.do?num=${pDTO.getOrder_no() }'">
					취소/반품</button></b>
				</c:if>
			</div>
			<br><br>
			<hr width="100%" color="white">
			<br><br>
			<c:set var="a" value="${pDTO.getOrderdate().substring(0,10) }" />
		</c:forEach>
	</div>
	</section>
</body>
</html>