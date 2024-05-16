<%@page import="webQuiz.BoardVO"%>
<%@page import="webQuiz.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String writer = request.getParameter("writer");
String title = request.getParameter("title");
String contents = request.getParameter("contents");

BoardDAO dao = new BoardDAO();
BoardVO vo = new BoardVO();
vo.setTitle(title);
vo.setWriter(writer);
vo.setContents(contents);
vo.setIp(request.getRemoteAddr());

dao.addOne(vo);
response.sendRedirect("list.jsp");
%>