<%@page import="kr.co.jhta.web.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jhta.web.dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
			<%
			String d = request.getParameter("deptno");
			if(d != null){
				int deptno = Integer.parseInt(d);
				DeptDAO dao = new DeptDAO();
				DeptVO vo = dao.selectOne(deptno);
			%>
			<tr>
				<td></a></td>
				<td><%=vo.getDname()%></td>
				<td><%=vo.getLoc()%></td>
			</tr>
			
			<tr>
				<td colspan="3">
				<a href="modifyForm.jsp?deptno=<%=vo.getDeptno()%>" class="btn btn-primary">수정</a>
				<a href="deleteOk.jsp?deptno=<%=vo.getDeptno()%>" class="btn btn-primary">삭제</a>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>