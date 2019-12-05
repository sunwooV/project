package project.Buy.P001.D003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Buy.P001.D003.vo.B_P001_D003VO;





@Repository("B_P001_D003DAO")
public class B_P001_D003DAOImpl implements B_P001_D003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<B_P001_D003VO> selectCart(Map<String, Object> searchMap) throws DataAccessException {
	
		//sqlSession.selecList("mapping되는 xml.그 xml의 id", datatype)
		List<B_P001_D003VO> list = sqlSession.selectList("Buy.P001.D003.cartList", searchMap);
		
		return list;
	}

	@Override
	public void insertCart(Map<String, Object> searchMap) throws DataAccessException {
		sqlSession.update("Buy.P001.D003.insertCart", searchMap);
		
	}

	@Override
	public void updateCart(Map<String, Object> searchMap) throws DataAccessException {
		
		
	}

	@Override
	public void deleteCart(Map<String, Object> searchMap) throws DataAccessException {
		
		
	}



	
	

}
