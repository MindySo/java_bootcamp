<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String no = request.getParameter("no");
	%>
	
	<%-- <h3>전달받은 값 : <%= no %></h3> --%>
	<h3>전달받은 값 : ${param.no}</h3>	<!-- null로 표현되지 않음 -->
	
	<%
		Object id = request.getParameter("id");
	%>
	<h3>전달받은 값 2 : <%= id %></h3>		<!-- = null -->
	<h3>전달받은 값 3 : ${param.id}</h3>	<!-- = 공백 -->
	<h3>간단한 연산 가능 : ${100+200}</h3>
</body>
</html>