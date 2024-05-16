package day02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/friday.do")
public class Friday extends HttpServlet{
	
	//Get 방식은 주소값에 정보를 전달 : 보안 꽝, 여러번 실행해도 서버에 변화 없음
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		friday(resp);
	}
	
	//Post 방식은 바디에 실어서 보냄 , 여러번 실행하면 서버에 변화를 줄 수 있다
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		friday(resp);
	}

	private void friday(HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>오늘은 무슨 요일?</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>오늘은 금요일같은 수요일입니다...</h2>");
		out.println("</body>");
		out.println("</html>");
	}
	
}
