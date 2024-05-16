<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function(){
		$("img[src='../images/cart.png']").on("click", function(){
				/* alert("왜눌러"); */
				$("#showImg").show();
				window.setTimeout(function(){
					document.frm.action="cart.jsp";
					document.frm.method="get";
					document.frm.submit();
				}, 2000)
		})
	})
	function closeDiv(){
		$("#showImg").hide();
	}
</script>
<style>
.container {
	width: 1000px;
	margin: auto;
}

#pic {
	width: 500px;
	float: left;
}

table {
	width: 100%;
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
}

.info {
	width: 500px;
	float: left;
}

div#pic>img {
	width: 100%;
	height: 50%;
}

#desc {
	clear: both;
}

.icon {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	<%
	String p = request.getParameter("pno");
	if (p != null) {
		ProductDAO dao = new ProductDAO();
		int pno = Integer.parseInt(p);
		ProductVO vo = dao.getOne(pno);

		/* out.println("vo : " + vo.getPname()); */

		String bigfile = vo.getBigfile();
		String imgfile = vo.getImgfile();
		String pname = vo.getPname();
		int price = vo.getPrice();
		int dcratio = vo.getDcratio();
		int qty = vo.getQty();
		String prodesc = vo.getProdesc();
	%>
	<div class="container">
	
		<form action="" name="frm">
			<input type="hidden" name="pno" value=<%= vo.getPno() %> />
		</form>
      
         <div id="pic">
            <img src="<%= vo.getBigfile() %>" alt="<%= vo.getPname() %>" />
         </div>
         
         <div class="info">
            <table>
               <tr colspan="2">
                  <%= vo.getPname() %>
               </tr>
               <tr>
                  <td>판매가격</td>
                  <td><%= vo.getPrice() %></td>
               </tr>
               <tr>
                  <td>할인가격</td>
                  <td><%= vo.getDcratio() %></td>
               </tr>
               <tr>
                  <td colspan="2">
                     <img class="icon" src="../images/buy.png" alt="" />
                     <img class="icon" src="../images/cart.png" alt="" />
                     <a href="viewCart.jsp">장바구니 보러가기</a>
                     <a href="productList.jsp">상품목록</a>
                  </td>
               </tr>
            </table>
         </div>
         
         <div class="desc">
            <!-- 제품 상세 설명 -->
            <p><%= vo.getProdesc() %></p>
         </div>
         
         <div id="showImg" style="display: none;">
            <h1>장바구니에 넣었습니다.</h1>
            <a href="javascript:closeDiv()">닫기</a>
         </div>
         
         
      </div>



	<%
	}
	%>
</body>
</html>