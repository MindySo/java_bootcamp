<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sumValue.jsp</title>
</head>
<body>
	<!-- 스크립트 요소 
		1. 스크립트릿
		2. 표현식
		3. 선언
		
		선언부와 스크립트릿 순서가 바뀌어도 상관없이 실행된다
		-->
		
	<%
		// 실행부 : _jspService() 안쪽으로 
		int k = 0; 	// _jspservice() 지역변수
		for( int i = 1 ; i <= 100 ; i++){
			sum += i;
		}
	%>
	
	<%!
		// 변수 선언부 : 클래스의 멤버변수(필드)
		int sum = 0;
	%>
	
	<h1>1부터 100까지 누적합계 : <%=sum %></h1>
</body>
</html>