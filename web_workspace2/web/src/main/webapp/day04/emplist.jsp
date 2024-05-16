<%@page import="vo.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 table {
    width: 80%;
    margin: 50px auto;
    text-align: center;
 }
 table, td, th {
    border: 1px solid black;
    border-collapse: collapse;    
 }
 .deptno{
 	width: 10%;
 }
 .dname{
 	width: 10%;
 }
 .loc{
 	width: 10%;
 }
 
</style>
</head>
<body>
	<%
	EmpDAO dao = new EmpDAO();
	ArrayList<EmpVO> list = dao.selectAll();
	System.out.println("list : " + list);
	
	%>
	<table>
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
			for(EmpVO vo : list){
		%>
		<tr>
			<td class="empno"><%=vo.getEmpno() %></td>
			<td class="ename"><%=vo.getEname() %></td>
			<td class="job"><%=vo.getJob() %></td>
			<td class="mgr"><%=vo.getMgr() %></td>
			<td class="hiredate"><%=vo.getHiredate() %></td>
			<td class="sal"><%=vo.getSal() %></td>
			<td class="comm"><%=vo.getComm() %></td>
			<td class="deptno"><%=vo.getDeptno() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>