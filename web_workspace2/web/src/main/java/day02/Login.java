package day02;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
	//200 : 정상처리
	//404 : 자원을 못 찾음
	//405 : 방식을 지원하지 않음
	//500 : 서버 쪽 프로그램 에러
public class Login extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doLogin(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doLogin(req, resp);
	}

	private void doLogin(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, UnsupportedEncodingException {
		PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title> 로그인 </title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>당신의 ID : " + id + "<h2>");
		out.println("<h2>당신의 PW : " + pw + "<h2>");
		// id와 pw를 가지고 db에 가서 데이터를 검색 후 존재하는지 여부를 판단..
		out.println("</body>");
		out.println("</html>");
	}

}
