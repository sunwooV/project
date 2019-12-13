package project.Customers.P002.D005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D005.vo.C_P002_D005VO;


@Repository("C_P002_D005DAO")
public class C_P002_D005DAOImpl implements C_P002_D005DAO{
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public void insertMessage(C_P002_D005VO c_p002_d005vo) throws Exception {
		sqlSession.insert("Customers.chat.insertMessage",c_p002_d005vo);
		
	}
	
	@Override
	public List<C_P001_D001VO> selectSeller(Map<String, Object> searchMap) throws Exception {
		List<C_P001_D001VO> list = sqlSession.selectList("Customers.chat.selectSeller",searchMap);
		return list;
	}

	@Override
	public List<C_P001_D001VO> selectMemberList(Map<String, Object> searchMap) throws Exception {
		List<C_P001_D001VO> list = sqlSession.selectList("Customers.chat.selectMemberList",searchMap);
		return list;
	}

	@Override
	public List<C_P002_D005VO> selectMessageList(C_P002_D005VO c_p002_d005vo) throws Exception {
		List<C_P002_D005VO> list = sqlSession.selectList("Customers.chat.selectMessageList", c_p002_d005vo);
		return list;
	}

	@Override
	public List<C_P001_D001VO> selectSearchList(Map<String, String> searchMap) throws Exception {
		List<C_P001_D001VO> list=sqlSession.selectList("Customers.chat.selectSearchList", searchMap);
		return list;
	}
	

	@Override
	public String sellerId(Map<String, Object> searchMap) throws Exception {
		String list=sqlSession.selectOne("Customers.chat.sellerId", searchMap);
		return list;
	}

}
