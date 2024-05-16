<%@page import="vo.MovieVO"%>
<%@page import="dao.MovieDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 파일 저장경로 설정
String saveDir = application.getRealPath("/upload");

int maxFileSize = 1024 * 1024 * 30;
MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());

String name = mr.getParameter("name");
System.out.println(name);
String filepath = "../upload/" + mr.getOriginalFileName("filename");
System.out.println(filepath);

MovieDAO dao = new MovieDAO();
MovieVO vo = new MovieVO(name, filepath);

dao.insertOne(vo);

response.sendRedirect("addMovie.jsp");
%>