<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
// out.println("ACCOUNTING,SALES,OPERATION,RESEARCH");
DeptDAO dao = new DeptDAO();
ArrayList<DeptVO> list = dao.selectAll();

// 반복문을 잘 사용하여 ACCOUNTING,SALES,OPERATION,RESEARCH 형태로 화면에 출력
for( int i = 0 ; i < list.size() ; i++){
	DeptVO vo = list.get(i);
	out.println(vo.getDname());
	if( i != list.size() - 1 ){
		out.println(",");
	}
}
%>