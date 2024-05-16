<%@page import="vo.MovieVO"%>
<%@page import="dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// idCheckup.jsp?id=aaa
String movie = request.getParameter("movie");
if (movie != null) {
	MovieDAO dao = new MovieDAO();
	MovieVO vo = dao.getOne(movie);		
	if(vo != null){
		out.println(vo.getFilePath());
	} else{
		out.println("false");
	}
}
%>