<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/inputCategory.do">
		<div>
			ī�װ� �ѹ� <br>
			<select name="cno">
				<option value="1">
					���� 1��
				</option>
				
				<option value="2">
					���� 2��
				</option>
				
				<option value="3">
					���� 3��
				</option>
			
			</select>
		</div>
		
		<div>
			ī�װ� �ڵ� 
			<input name="ccode">
		</div>
		
		<div>
			ī�װ� �̸�
			<input name="cname">
		</div>
		<br>
		<div>
			ī�װ� �̹��� 
			<br>
			<input type="file" name="cimage">
		</div>
		<br>
		<div>
			<input type="submit" value="���">
		</div>
		</form>
		
	
	</div>
	
	<br>
	<br>
	<br>
	
	<div align="center">
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/insertProduct.do">
		<h2>��ǰ ���</h2>
	 
		<div>
		�̸�
		<input name="pName">	
		</div>
		
		<div>
		ī�װ� �ڵ� ����
		<select name="pCategory">
			<option selected>
			none
			</option>
			<option value="1w1n0000">
			new arrivals
			</option>
			<option value="1w1s0000">
			shoes
			</option>
			<option value="1w1b0000">
			bags
			</option>
		
		</select>
		</div>
		<br>
		<div>
		ī�װ� �ڵ� ����
		<select name="pCategory">
			<option selected>
			none
			</option>
			<option value="2man0000">
			new arrivals
			</option>
			<option value="2mbt0000">
			top
			</option>
			<option value="2mcp0000">
			pants
			</option>
		
		</select>
		</div>
		
		<div>
		�̹���
		<input type="file" name="pImage">	
		</div>
		
		<div>
		����
		<input type="number" name="pQty" min="1">	
		</div>
		
		<div>
		����
		<input name="price">	
		</div>
		
		<div>
		������
		<input name="pSize">	
		</div>
		
		<div>
		����
		<input name="pColor">	
		</div>
		
		<div>
		�з�
		<select name="pIcon">
			<option value="new">
			�Ż�
			</option>
			
			<option value="hit">
			�α�
			</option>
			
			<option value="recommand">
			��õ
			</option>
			
			<option value="none">
			����
			</option>
			
		</select>	
		</div>
		
		<div>
		����
		<textarea rows="20" cols="50" name="content"></textarea>	
		</div>
		
		
		
		<br>
		
		<input type="submit" value="���">
	
	</form>
	</div>

	
	
	
	
</body>
</html>