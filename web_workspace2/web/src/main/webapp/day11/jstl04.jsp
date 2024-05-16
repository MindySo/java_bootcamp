<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>no1 : ${ param.no1 }</h1>
	<h1>no2 : ${ param.no2 }</h1>

	<h1>EL로 출력 : ${ param.no1 > param.no2 ? param.no1 : param.no2}</h1>
	<h1>
		<c:if test="${ param.no1 >= param.no2 }">
			<h1>JSTL로 출력 : ${ param.no1 }</h1>
		</c:if>
		
		<c:if test="${ param.no1 < param.no2 }">
			<h1>JSTL로 출력 : ${ param.no2 }</h1>
		</c:if>
	</h1>
</body>
</html>