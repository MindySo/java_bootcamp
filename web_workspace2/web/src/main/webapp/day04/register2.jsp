<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="registerOk.jsp">
		ID : <input type="text" name="id" id="" value="" /><br>
		NAME : <input type="text" name="name" id="" value="" /><br>
		비밀번호 : <input type="text" name="pw" id="" value="" /><br>
		성별 : <input type="radio" name="gender" id="" value="man" />남
				<input type="radio" name="gender" id="" value="female" />여<br>
		지원동기 : <input type="text" name="motive" id="" value="" /><br>
		<input type="submit" value="가입하기"/>
		<input type="submit" value="취소하기"/>
	</form>
</body>
</html>