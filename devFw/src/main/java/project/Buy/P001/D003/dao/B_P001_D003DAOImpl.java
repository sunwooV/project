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
		System.out.println("Buy P001 D003 DAO 당");
		//sqlSession.selecList("mapping된 xml.그xml의 id값",)
		List<B_P001_D003VO> list = sqlSession.selectList("B_P001_D003.selectCart", searchMap);
		return list;
	}

//	@Override
//	public List<B_P001_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<B_P001_D003VO> searchAdd() throws DataAccessException {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
	

}
