<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시판 > 글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/qa.css">
</head>
<body>
		<jsp:include page="/include/shop_top.jsp"/>
		<jsp:include page="/include/shop_top_right.jsp"/>
	<div class="qa_container">

		<div class="alltitle">
		<div class="apcTitle">
			<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
		</div>
		<div class="apcTitle_sub">
			/  Q&A
		</div>
		</div>
		
		<div class="qa_body">
		<form id="qa_form" method="post" name="frm" action="<%=request.getContextPath()%>/qa_write_ok.do" >
		<input type="hidden" id="pno" name="pno" value="${pCont.getPno() }">
		<%-- <input type="hidden" id="num" name="num" value="${num }"> --%>
		
		<table class="qa_top_table" >
		<c:if test="${empty pCont }"><!-- 넘겨받은 제품정보가 없으면  -->
			<tr >
				<td rowspan="2">
				<img src="<%=request.getContextPath() %>/images/img_no.gif" width="100%" height="100%">
				</td>
			</tr>
			<tr>
				<td rowspan="2">
					<button type="button" class="btn btn-outline-dark" 
					onclick="window.open( '<%=request.getContextPath()%>/board/qa_popup_product.jsp', '', 'width=500,height=400, scrollbars=yes,directories=no') ">
					제품 정보선택
					</button>
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty pCont }"><!-- 넘겨받은 제품정보가 있으면  -->
			<tr >
				<td rowspan="2" width="50%">
				<img src="<%=request.getContextPath() %>/upload/${pimage}" width="100%" height="100%">
				</td>
				<td><span>${pCont.getPname() }</span> <br>
					<span>SIZE: ${pCont.getPsize() }/ COLOR : ${pCont.getPcolor() }</span><br>
					<span>${pCont.getPrice() }원</span>
				</td>
			</tr>
			<tr>
				
				<td width="50%">
					<button type="button" class="btn btn-outline-dark" 
					onclick="location.href='product_detail.do?num=${pCont.getPno() }&color=${pCont.getPcolor() }&size=${pCont.getPsize() }'">
					제품 상세보기
					</button>
				</td>
			</tr>
		</c:if>
		</table>
		
<%-- 		<table id="qa_top_table" >
			<tr >
				<td rowspan="2">
				<img src="<%=request.getContextPath() %>/upload/${fileName}" width="10%" height="10%">
				</td>
				<td>
					${pDto.getPname() } <br>
					${pDto.getPrice() }
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-outline-dark" onclick="loaction.href='<%=request.getContextPath()%>/product_list.do?num=${pDto.getPno() }'">
					제품 상세보기
					</button>
				</td>
			</tr>
		</table> --%>
			
			<table class="table">
			
				<tbody>
					<tr>
					<td class= "table-light"> 제목 </td>
					<td><input name="qa_title" style="border: none; background: transparent;" size="100"></td></td>
					</tr>
					<tr>
						<td class= "table-light"> 분류 </td>
						<td>
							<select name="qa_category">
							<c:set var="list" value="${qac }" />
							<c:if test="${empty list }">
								<option>없음</option>
							</c:if>
							<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dto">
								<option value="${dto.getCategory_code()}">${dto.getCategory_name() }</option>
							</c:forEach>
							</c:if>
							</select>
						
					</tr>
					<tr>
						<td class="table-light">작성자</td>
						<td>
						<input name="qa_writer" style="border: none; background: transparent;" size="100" value="${member_id }" readonly>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<textarea rows="20" cols="200" name="qa_cont">${cont.getQa_cont() }</textarea> </td>
					</tr>
					
					<!-- 비밀번호는 로그인 아이디 비밀번호 그대로 사용 굳이 추가할 필요없을듯 -->
					<!-- 	<tr>
						<td class="table-light">비밀번호</td>
						<td><input name="qa_pwd" type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" >
							<br><span id="passwordHelpInline" class="form-text"> </span>
						</td>
						</tr>  -->
				</tbody>
			</table>
				<div id="btnGroup" >
					<div id="groupItem1" align="left">
					<button type="button" class="btn btn-outline-dark" 
						onclick="location.href='<%=request.getContextPath() %>/qa_list.do'">
						목록
					</button>
					</div>
					<div id="groupItem2" align="right">
					<input type="submit" class="btn btn-outline-dark"  value="등록">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">취소</button>
					</div>
				</div>
		</form>
		</div>
	</div> <!-- class="qa_container" -->
	
</body>
</html>