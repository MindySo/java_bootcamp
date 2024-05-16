package webQuiz;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu2.do")
public class menu2 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		String menuList[] = req.getParameterValues("menu");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title></title>");
		out.println("</head>");
		out.println("<body>");
		for (String string : menuList) {
			out.println("<h3>오늘 저녁은 " + string + "입니다.</h3>");
		}
		out.println("</body>");
		out.println("</html>");
	}
}
