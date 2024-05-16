<%@page import="vo.EmpDeptVO"%>
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
	ArrayList<EmpDeptVO> list = dao.selectAllByJoin();
	System.out.println("list : " + list);
	
	%>
	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>급여</th>
			<th>부서번호</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
		<%
			for(EmpDeptVO vo : list){
		%>
		<tr>
			<td class="empno"><%=vo.getEmpno() %></td>
			<td class="ename"><%=vo.getEname() %></td>
			<td class="sal"><%=vo.getSal() %></td>
			<td class="deptno"><%=vo.getDeptno() %></td>
			<td class="dname"><%=vo.getDname() %></td>
			<td class="loc"><%=vo.getLoc() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>