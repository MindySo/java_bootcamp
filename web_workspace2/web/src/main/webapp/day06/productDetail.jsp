<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   * {
      margin: 0;
      padding: 0;
   }
   #container {
      width: 1000px;
      margin: auto;
   }
   img {
      width: 200px;
      height: 200px;
   }
   p {
      text-align: center;
   }
   .wrap {
      width: 200px;
      border: 1px solid red;
      float: left;
      padding: 20px;
   }
   .del {
	text-decoration: line-through;
   }
</style>
</head>
<body>
	<%
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.getOne(pno);
		
		String bigfile = vo.getBigfile();
		String imgfile = vo.getImgfile();
		String pname = vo.getPname();
		int price = vo.getPrice();
		int dcratio = vo.getDcratio();
		int qty = vo.getQty();
		String prodesc = vo.getProdesc();
	%>
	 <div class="wrap">
            <img src="<%= vo.getImgfile() %>" alt="" />
            <img src="<%= vo.getBigfile() %>" alt="" />
            <p><%= vo.getPname() %></p>
            <p class="del"><%= vo.getPrice() %></p>
            <p>대박할인</p>
            <p><%= vo.getDcratio() %></p>
			<p><%= Math.round(vo.getPrice() * (1 - vo.getDcratio()*0.01)) %>원</p>
			<p><%= vo.getProdesc() %></p>
            <p>
               <input type="button" value="즉시구매" />
               <input type="button" value="장바구니" />
            </p>
         </div>
</body>
</html>