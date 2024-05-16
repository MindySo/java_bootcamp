<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="vo.ProductVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 파일 저장경로 설정
String saveDir = application.getRealPath("/upload");

int maxFileSize = 1024 * 1024 * 30;

// MultipartRequest : 웹 페이지에서 서버로 업로드되는 파일 자체만을 다루는 클래스
// 1. form 태그 안에 :  method 는 post
// 2. form 태그 안에 : enctype="multipart/form-data"

// new DefaultFileRenamePolicy() : 업로드 될 파일명이 같을 경우 덮어쓰기 방지
MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());

// 이제 parameter를 받을 때 request.로 받지 않고 mr로 받아야 작동한다.
String pname = mr.getParameter("pname");
String pfile1 = mr.getOriginalFileName("imgfile");
String pfile2 = mr.getOriginalFileName("bigfile");
int qty = Integer.parseInt(mr.getParameter("qty"));
int price = Integer.parseInt(mr.getParameter("price"));
int sale = Integer.parseInt(mr.getParameter("dcratio"));
String contents = mr.getParameter("prodesc");

ProductDAO pdao = new ProductDAO();
ProductVO vo = new ProductVO(pname, price, sale, contents, qty, pfile1, pfile2);

pdao.insertOne(vo);

response.sendRedirect("productList.jsp");
%>