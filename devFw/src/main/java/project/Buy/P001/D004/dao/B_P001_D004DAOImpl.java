package project.Buy.P001.D004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Buy.P001.D004.vo.B_P001_D004VO;





@Repository("B_P001_D004DAO")
public class B_P001_D004DAOImpl implements B_P001_D004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<B_P001_D004VO> insertPaymentInfo(Map<String, Object> searchMap) throws DataAccessException {
	
		//sqlSession.selecList("mapping되는 xml.그xml의 id값",)
		List<B_P001_D004VO> list = sqlSession.selectList("b_p001_d004.insertPaymentInfo", searchMap);
		return list;
	}

}
