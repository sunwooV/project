package project.Main.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Main.P001.D001.vo.M_P001_D001VO;

@Repository("M_P001_D001DAO")
public class M_P001_D001DAOImpl implements M_P001_D001DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<M_P001_D001VO> newProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D001VO> list = sqlSession.selectList("Main.p001_d001.newProduct", searchMap);
		return list;
	}
}
