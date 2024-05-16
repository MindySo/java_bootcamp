<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- a.jsp 파일을 불러오기 -->
	<!-- 1. include 지시자를 사용 -->
	<!-- copy&paste 효과 -->
	<%-- <%@ include file="a.jsp" %> --%>

	<!-- jsp action tag -->
	<!-- 컴파일된 결과를 삽입 -->
	<%-- <%@ jsinclude file="a.jsp" %></jsp:include > --%>
	
	<%
		// a 변수를 출력
		/* out.println("b.jsp에서 a의 값 : " + a); */
	%>
</body>
</html>