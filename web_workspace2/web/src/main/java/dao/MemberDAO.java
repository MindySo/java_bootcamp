package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;

public class MemberDAO {

	// 1. 환경변수
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "scott";
	String password = "tiger";
	Connection conn = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	public MemberDAO() {

		// 2. 드라이버로딩
		try {
			Class.forName(driver);
			// 3. connection
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}

	}// constructor end
	
	public ArrayList<MemberVO> selectAll(){
		sb.setLength(0);
		sb.append("SELECT no, id, pw, name, gender, motive, zipcode FROM member");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String motive = rs.getString("motive");
				int zipcode = rs.getInt("zipcode");
				MemberVO vo = new MemberVO(no, id, pw, name, gender, motive, zipcode);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public MemberVO searchUser(String id, String pw) {
		sb.append("SELECT id, pw, name FROM member WHERE id = ? and pw = ? ");
		MemberVO mvo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				mvo = new MemberVO();
				mvo.setId(id);
				mvo.setPwd(pw);
				mvo.setName(name);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mvo;
	}

	public void insertOne(MemberVO vo) {
		// sb 길이를 0으로 만들어서 초기화
		sb.setLength(0);
		sb.append("INSERT INTO member VALUES (MEMBER_NO_SEQ.nextval, ?, ?, ?, ?, ?, ?)");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getMotive());
			pstmt.setInt(5, vo.getZipcode());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVO getOne(String id) {
		sb.append("SELECT id, pw, name FROM member WHERE id = ?");
		MemberVO mvo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				mvo = new MemberVO();
				mvo.setId(id);
				mvo.setPwd(pw);
				mvo.setName(name);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mvo;
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
