package project.Etc.P002.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P007.D001.vo.C_P007_D001VO;
import project.Etc.P002.D002.vo.E_P002_D002VO;

@Repository("E_P002_D002DAO")
public class E_P002_D002DAOImpl implements E_P002_D002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<E_P002_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<E_P002_D002VO> list = sqlSession.selectList("Ect.boarManage.searchList",searchMap);
		return list;
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("Ect.boarManage.updateData",row);
		
		
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("Ect.boarManage.insertData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("Ect.boarManage.deleteData",row);
		
	}

}
