package project.Buy.P002.D003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Buy.P001.D003.vo.B_P001_D003VO;




//리뷰작성완료
@Repository("B_P002_D003DAO")
public class B_P002_D003DAOImpl implements B_P002_D003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<B_P001_D003VO> selectCart(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("Buy P001 D003 DAO 당");
		//sqlSession.selecList("mapping되는 xml.그 xml의 id",)
		List<B_P001_D003VO> list = sqlSession.selectList("Buy.b_p001_d003.selectCart", searchMap);
		return list;
	}

	

}
