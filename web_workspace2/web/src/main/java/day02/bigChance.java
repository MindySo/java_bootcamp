package day02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bigChance.do")
public class bigChance extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>이번주 로또 번호</title>");
		out.println("</head>");
		out.println("<body>");
		Lotto lt = new Lotto();
		for (int i : lt.lottoBall()) {
			out.println("<img src='./images/ball" + i + ".png'></img>");
		}
		out.println("</body>");
		out.println("</html>");
	}
}
