package ex3;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IPCommand implements ActionCommand {
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("msg", req.getRemoteAddr());
		return  "ex3/ip.jsp";
	}
}
