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
	<form action="result.jsp">
		ID : <input type="text" name="id" id="" value="" /><br>
		NAME : <input type="text" name="name" id="" value="" /><br>
		주민등록번호 : <input type="text" name="idnum1" id="" value="" />
						- <input type="text" name="idnum2" id="" value="" /><br>
		비밀번호 : <input type="text" name="pw" id="" value="" /><br>
		전화번호 : <input type="text" name="tel1" id="" value="" />
					- <input type="text" name="tel2" id="" value="" />
					- <input type="text" name="tel3" id="" value="" /><br>
		주소 : <input type="text" name="address" id="" value="" /><br>
		EMAIL : <input type="text" name="email1" id="" value="" />
				@ <input type="text" name="email2" id="" value="" />
				<select class="box" name="domain">
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="kakao.com">kakao.com</option>
				</select>
				<br>
		성별 : <input type="radio" name="gender" id="" value="man" />남
				<input type="radio" name="gender" id="" value="female" />여<br>
		취미 : <input type="checkbox" name="hobby" id="" value="음악감상" />음악감상
				<input type="checkbox" name="hobby" id="" value="독서" />독서
				<input type="checkbox" name="hobby" id="" value="운동" />운동<br>
		<input type="submit" value="가입하기"/>
		<input type="submit" value="취소하기"/>
	</form>
</body>
</html>