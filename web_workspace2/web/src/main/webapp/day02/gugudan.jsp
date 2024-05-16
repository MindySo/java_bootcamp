<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan.jsp</title>
</head>
<body>
	<!-- HTML 주석 : 브라우저 소스코드에 노출-->
	<%-- JSP 주석 : 노출되지 않음 --%>

	<%
		for(int i = 1 ; i < 10 ; i++ ){
	%>
			<h1>3 * <%=i %> = <%=3*i %></h1>
	<%
		}
	%>			
</body>
</html>