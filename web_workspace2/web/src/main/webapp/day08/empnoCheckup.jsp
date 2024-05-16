<%@page import="dao.EmpDAO"%>
<%@page import="vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String empnoStr = request.getParameter("empno");
if (empnoStr != null) {
	int empno = Integer.parseInt(empnoStr);
	EmpDAO dao = new EmpDAO();
	EmpVO vo = dao.getOne(empno);		
	if(vo != null){
		out.println(vo.getEname());
	} else{
		out.println("false");
	}
}
%>