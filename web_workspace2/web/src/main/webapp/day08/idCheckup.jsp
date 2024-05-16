<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// idCheckup.jsp?id=aaa
String id = request.getParameter("id");
if (id != null) {
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.getOne(id);		
	
	// 5. vo가 null이라면 존재하지 않는 아이디 : 화면에 true 출력
	// 6. vo가 null이 아니라면 존재하는 아이디 : 화면에 false 출력
	if(vo == null){
		out.println("true");
	} else{
		out.println("false");
	}
}
%>