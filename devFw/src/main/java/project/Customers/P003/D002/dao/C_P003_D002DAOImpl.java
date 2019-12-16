package project.Customers.P003.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P003.D002.vo.C_P003_D002VO;
import project.Sell.P001.D001.vo.S_P001_D001VO;

@Repository("C_P003_D002DAO")
public class C_P003_D002DAOImpl implements C_P003_D002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<C_P003_D002VO> miuCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P003_D002VO> miuCategory = sqlSession.selectList("Customers.p003_d002.miuCategory", searchMap);
		return miuCategory;
	}

	@Override
	public List<C_P003_D002VO> sellerProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P003_D002VO> sellerProduct = sqlSession.selectList("Customers.p003_d002.sellerProduct", searchMap);
		return sellerProduct;
	}

}
