<%@page import="vo.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//out.println("SCOTT,BLACK,KING");

EmpDAO dao = new EmpDAO();
ArrayList<EmpVO> list = dao.selectAll();

//반복문을 잘 사용하여 ACCOUNTING,SALES,OPERATION,RESEARCH 형태로 화면에 출력
for( int i = 0 ; i < list.size() ; i++){
	EmpVO vo = list.get(i);
	out.println(vo.getEname());
	if( i != list.size() - 1 ){
		out.println(",");
	}
}
%>