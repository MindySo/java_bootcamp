<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@page import="java.util.ArrayList"%>
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
    border: 1px solid red;
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
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptVO> list = dao.selectAll();
	System.out.println("list : " + list);
	
	%>
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		<%
			for(DeptVO vo : list){
		%>
		<tr>
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