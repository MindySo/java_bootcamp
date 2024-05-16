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
		//모든 코드가 _jspService() 안으로 들어감
		String msg = request.getParameter("msg");
		out.println("<h2>" + msg + "</h2>");
	%>
	
	
</body>
</html>