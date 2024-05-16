<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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