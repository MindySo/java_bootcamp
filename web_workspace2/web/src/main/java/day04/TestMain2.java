package day04;

import dao.MemberDAO;
import vo.MemberVO;

public class TestMain2 {
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = dao.searchUser("bbb", "ccc");
		System.out.println("mvo : " + mvo);
		System.out.println(mvo.getId() + " : " + mvo.getPwd() + " : " + mvo.getName());
	}
}
