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
	// Cookie
	// 서버가 사용자 브라우저에 남기는 작은 정보의 조각

	String txt = request.getParameter("txt");
	Cookie c = new Cookie("txt", txt);
	// 이 쿠키의 유통기한을 1분으로
	c.setMaxAge(60 * 1);

	// 사용자 브라우저에 저장
	response.addCookie(c);

	out.println("<h3>" + txt + "</h3>");
	%>
	<a href="userCookieList.jsp">쿠키보러가기</a>
</body>
</html>