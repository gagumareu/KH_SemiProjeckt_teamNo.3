<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<br>
		<br>
		<form action="<%=request.getContextPath() %>/product_search.do">
			<input name="keyword"> 
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>