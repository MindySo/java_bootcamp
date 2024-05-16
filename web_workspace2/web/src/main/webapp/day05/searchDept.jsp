<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script>
	$(function(){
		
	})



</script>

</head>

<body>
	<div class="container">
		<form action="">
			<input type="text" name="deptno" id="" /> <input type="submit" value="검색" />
		</form>
		<div id="result">
			<%
			String input = request.getParameter("deptno");
			DeptDAO dao = new DeptDAO();
		/*  if( input.length() == 0 || input == null ){  // error : input이 null일 경우 length를 연산하지 못하기 때문 */
			if( input == null || input.length() == 0 ){
				ArrayList<DeptVO> deptarr = dao.selectAll();
				out.println("<table class='table'>");
				for(DeptVO vo : deptarr){
					out.println("<tr>");
					out.println("<td>" + vo.getDeptno() + "</td>");
					out.println("<td>" + vo.getDname() + "</td>");
					out.println("<td>" + vo.getLoc() + "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
			} else{
				try {
					DeptVO vo = dao.selectOne(Integer.parseInt(input));
					out.println("<table class='table'>");
					out.println("<tr>");
					out.println("<td>" + vo.getDeptno() + "</td>");
					out.println("<td>" + vo.getDname() + "</td>");
					out.println("<td>" + vo.getLoc() + "</td>");
					out.println("</tr>");
					out.println("</table>");
			    } catch (NumberFormatException e) {    //에러 발생일 경우
					out.println("<table class='table'><tr><td>올바른 값을 입력해주세요.</td></tr></table>");
			    }
			}
			%>
		</div>
	</div>
</body>
</html>