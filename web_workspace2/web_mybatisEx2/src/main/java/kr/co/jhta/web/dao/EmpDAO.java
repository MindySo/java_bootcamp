package kr.co.jhta.web.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jhta.web.vo.EmpVO;

public class EmpDAO {
	private SqlSessionFactory factory;
	
	public EmpDAO() {
		Reader r;
		try {
			r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			factory = builder.build(r);
			r.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// constructor end
	
	public List<EmpVO> selectAll(){
		SqlSession ss = factory.openSession(true);
		List<EmpVO> list = ss.selectList("queryAllEmp");
		return list;
	}
	
	public EmpVO selectOne() {
		SqlSession ss = factory.openSession(true);
		EmpVO vo = ss.selectOne("queryEmpOne");
		return vo;
	}
	
	public void addOne(EmpVO vo) {
		SqlSession ss = factory.openSession(true);
		ss.insert("insertEmpOne", vo);
		ss.close();
	}
	
	public void updateOne(EmpVO vo) {
		SqlSession ss = factory.openSession(true);
		ss.update("updateEmpOne", vo);
	}
	public void deleteOne(int empno) {
		SqlSession ss = factory.openSession(true);
		ss.delete("deleteEmpOne", empno);
	}
}
