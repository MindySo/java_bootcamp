package day01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/today.do")
public class Today extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Today 서블릿 실행 중");
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>today.do</title>");
		out.println("</head>");
		out.println("<body>");
		Date today = new Date();
		SimpleDateFormat datefmt = new SimpleDateFormat("yyyy년 M월 d일 h시 m분 s초");
		out.println("<h3>" + datefmt.format(today) + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}
}
