package project.Main.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Main.P001.D001.vo.M_P001_D001_VO;

@Repository("M_P001_D001_DAO")
public class M_P001_D001_DAOImpl implements M_P001_D001_DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<M_P001_D001_VO> newProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D001_VO> list = sqlSession.selectList("Main.main.newProduct", searchMap);
		System.out.println("dao¿¡¼­ list \n " + list);
		return list;
	}
}
