<%@page import="vo.DeptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

	<%
		// 객체를 하나 생성하고 부서정보를 입력하세요
		// 99 AI Busan
		// vo 객체
		
		/* 
		DeptVO vo = new DeptVO();
		vo.setDeptno(99);
		vo.setDname("AI");
		vo.setLoc("Busan");
		 */
		 
		// VO(Value Object) == javaBean == DTO(Data Transfer Object)
		// POJO(Plain Old Java Object)
	%>
	
	<!-- DeptVO vo = new DeptVO(); 와 같은 기능 -->
	<jsp:useBean id="vo" class="vo.DeptVO" scope="session"></jsp:useBean>
	
	<!-- vo.setdeptno(99); -->
	<jsp:setProperty property="deptno" name="vo" value="99"/>
	<jsp:setProperty property="dname" name="vo" value="AI"/>
	<jsp:setProperty property="loc" name="vo" value="Busan"/>
	
	<div class="container">
	 <table class="table table-striped">
	 	<tr>
	 		<th>부서번호</th>
	 		<th>부서명</th>
	 		<th>부서위치</th>
	 	</tr>
	 	<tr>
	 		<td><%= vo.getDeptno() %></td>
	 		<td><%= vo.getDname() %></td>
	 		<td><%= vo.getLoc() %></td>
	 		
	 		<td><jsp:getProperty property="deptno" name="vo"/></td>
	 		<td><jsp:getProperty property="dname" name="vo"/></td>
	 		<td><jsp:getProperty property="loc" name="vo"/></td>
	 	</tr>
	 </table>
	</div>
	<jsp:forward page="actionTag03.jsp"></jsp:forward>
</body>
</html>