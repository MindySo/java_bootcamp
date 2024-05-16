package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MovieVO;

public class MovieDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "scott";
	String password = "tiger";
	Connection conn = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	public MovieDAO() {
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

	}
	
	public MovieVO getOne(String input) {
		sb.append("SELECT filepath FROM movie WHERE title = ? ");
		MovieVO mvo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, input);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String filepath = rs.getString("filepath");
				mvo = new MovieVO();
				mvo.setTitle(input);
				mvo.setFilePath(filepath);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mvo;
	}

	public void insertOne(MovieVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO movie VALUES (?, ?)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getFilePath());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
