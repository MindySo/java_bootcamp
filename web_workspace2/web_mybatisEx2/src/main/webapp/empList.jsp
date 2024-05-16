<%@page import="kr.co.jhta.web.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jhta.web.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
<div class="container">
		<table class="table table-striped">
			<tr>
				<th>사원번호</th>
				<th>사원명</th>
				<th>직업</th>
				<th>담당 매니저</th>
				<th>입사일자</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서번호</th>
			</tr>
			<%
			EmpDAO dao = new EmpDAO();

			List<EmpVO> list = dao.selectAll();

			for (EmpVO vo : list) {
			%>
			<tr>
				<td><%=vo.getEmpno()%></td>
				<td><%=vo.getEname()%></td>
				<td><%=vo.getJob()%></td>
				<td><%=vo.getMgr()%></td>
				<td><%=vo.getHiredate()%></td>
				<td><%=vo.getSal()%></td>
				<td><%=vo.getComm()%></td>
				<td><%=vo.getDeptno()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>