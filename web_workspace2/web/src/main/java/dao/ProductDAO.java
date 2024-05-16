package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;

import vo.ProductVO;

public class ProductDAO {
	// 1. 멤버필드
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	// 생성자

	public ProductDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다.");
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}

	}// constructor end

	public ProductVO getOne(int pno) {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product WHERE pno = ?");
		ProductVO vo = null;
		try {
			// 5
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			// 6
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pnum = rs.getInt("pno");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int dcratio = rs.getInt("dcratio");
				String prodesc = rs.getString("prodesc");
				int qty = rs.getInt("qty");
				String imgfile = rs.getString("imgfile");
				String bigfile = rs.getString("bigfile");
				vo = new ProductVO();
				vo.setPno(pno);
				vo.setPname(pname);
				vo.setPrice(price);
				vo.setDcratio(dcratio);
				vo.setProdesc(prodesc);
				vo.setQty(qty);
				vo.setImgfile(imgfile);
				vo.setBigfile(bigfile);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	public ProductVO getOneByName(String pname) {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product WHERE pno = ?");
		ProductVO vo = null;
		try {
			// 5
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, pname);
			// 6
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pno = rs.getInt("pno");
				int price = rs.getInt("price");
				int dcratio = rs.getInt("dcratio");
				String prodesc = rs.getString("prodesc");
				int qty = rs.getInt("qty");
				String imgfile = rs.getString("imgfile");
				String bigfile = rs.getString("bigfile");
				vo = new ProductVO();
				vo.setPno(pno);
				vo.setPname(pname);
				vo.setPrice(price);
				vo.setDcratio(dcratio);
				vo.setProdesc(prodesc);
				vo.setQty(qty);
				vo.setImgfile(imgfile);
				vo.setBigfile(bigfile);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	// findByName
	public ArrayList<ProductVO> findByName(String input) {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product WHERE pname LIKE ?");
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			// 5
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + input + "%");
			// 6
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pnum = rs.getInt("pno");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int dcratio = rs.getInt("dcratio");
				String prodesc = rs.getString("prodesc");
				int qty = rs.getInt("qty");
				String imgfile = rs.getString("imgfile");
				String bigfile = rs.getString("bigfile");
				ProductVO vo = new ProductVO(pnum, pname, price, dcratio, prodesc, qty, imgfile, bigfile);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ProductVO> selectAll() {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product");
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pnum = rs.getInt("pno");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int dcratio = rs.getInt("dcratio");
				String prodesc = rs.getString("prodesc");
				int qty = rs.getInt("qty");
				String imgfile = rs.getString("imgfile");
				String bigfile = rs.getString("bigfile");
				ProductVO vo = new ProductVO(pnum, pname, price, dcratio, prodesc, qty, imgfile, bigfile);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void insertOne(ProductVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO product ");
		sb.append("VALUES (PRODUCT_PNO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPname());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setInt(3, vo.getDcratio());
			pstmt.setString(4, vo.getProdesc());
			pstmt.setInt(5, vo.getQty());
			pstmt.setString(6, vo.getImgfile());
			pstmt.setString(7, vo.getBigfile());

			int result = pstmt.executeUpdate();

			System.out.println("result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateOne(ProductVO vo) {
		sb.setLength(0);
		sb.append("UPDATE product ");
		sb.append(
				"SET pno = ?, pname = ?, price = ? , dcratio = ? , prodesc = ? , qty = ? , imgfile = ? , bigfile = ?");
		sb.append("WHERE pno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPno());
			pstmt.setString(2, vo.getPname());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setInt(4, vo.getDcratio());
			pstmt.setString(5, vo.getProdesc());
			pstmt.setInt(6, vo.getQty());
			pstmt.setString(7, vo.getImgfile());
			pstmt.setString(8, vo.getBigfile());

			int result = pstmt.executeUpdate();

			System.out.println("수정완료 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteOne(int pno) {
		sb.setLength(0);
		sb.append("DELETE FROM product ");
		sb.append("WHERE pno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ProductVO> getData(Set key) {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product WHERE pno = ?");
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			for (Object pno : key) {
				PreparedStatement pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, (int) pno);
				rs = pstmt.executeQuery();
				rs.next();
				int pnum = rs.getInt("pno");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int dcratio = rs.getInt("dcratio");
				String prodesc = rs.getString("prodesc");
				int qty = rs.getInt("qty");
				String imgfile = rs.getString("imgfile");
				String bigfile = rs.getString("bigfile");
				ProductVO vo = new ProductVO(pnum, pname, price, dcratio, prodesc, qty, imgfile, bigfile);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
	}
}
