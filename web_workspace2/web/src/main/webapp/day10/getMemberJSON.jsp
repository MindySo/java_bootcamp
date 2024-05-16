<%@page import="org.json.simple.JSONObject"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 멤버 테이블의 데이터를 가져와서 JSON 형식으로 변환 후 화면에 출력
JSONArray memberArray = new JSONArray();

MemberDAO dao = new MemberDAO();
ArrayList<MemberVO> list = dao.selectAll();

for(MemberVO vo : list){
	JSONObject member = new JSONObject();
	
	member.put("id", vo.getId());
	member.put("pw", vo.getPwd());
	member.put("name", vo.getName());
	
	memberArray.add(member);
}
out.println(memberArray.toJSONString());
%>
