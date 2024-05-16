<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- page 디렉티브(directive) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie.jsp</title>
<style>
	img{
	width: 300px
	height: 300px
	}
</style>
</head>
<body>
	<h1>영화포스터</h1>
	<%
		/* Scriptlet 스크립트렛 : 자바코드*/
		/* Expression 표현식 : 변수만 */
		for(int i = 1 ; i <= 5 ; i++ ){
	%>
			<img alt="" src="../images/<%=i %>.jpg">
	<% 
		}
	%>			
</body>
</html>