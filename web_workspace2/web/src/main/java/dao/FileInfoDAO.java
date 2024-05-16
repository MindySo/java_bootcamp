package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.FileInfoVO;

public class FileInfoDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "scott";
	String password = "tiger";
	Connection conn = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	public FileInfoDAO() {
		try {
			Class.forName(driver);
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

	public ArrayList<FileInfoVO> selectAll() {
		sb.setLength(0);
		sb.append("SELECT fno, filepath, type, no FROM fileinfo");
		ArrayList<FileInfoVO> list = new ArrayList<FileInfoVO>();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int fno = rs.getInt("fno");
				String filepath = rs.getString("filepath");
				String type = rs.getString("type");
				int no = rs.getInt("no");

				FileInfoVO vo = new FileInfoVO(fno, filepath, type, no);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addFileOne(String filePath, String type, int no) {
		sb.setLength(0);
		sb.append("INSERT INTO fileinfo VALUES(FILEUP_NO_SEQ.NEXTVAL, ?, ?, ?)");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, filePath);
			pstmt.setString(2, type);
			pstmt.setInt(3, no);
			
			int result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
