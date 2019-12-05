package project.CS.P001.D003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;
import project.Customers.P002.D008.vo.C_P002_D008VO;
import project.Sell.P001.D003.dao.S_P001_D003DAO;
import project.Sell.P001.D003.vo.S_P001_D003VO;

@Repository("CS_P001_D003DAO")
public class CS_P001_D003DAOImpl implements CS_P001_D003DAO{
	@Autowired
	SqlSession sqlSession = null;
	
	
	@Override
	public List privatelist(PagingVO vo) throws DataAccessException {
		List<CS_P001_D003DAO> privatelist = null;
		privatelist = sqlSession.selectList("CS.private.privatelist");
		System.out.println("privatelist" + privatelist);
		return privatelist;
	}

	
	@Override
	public int countBoard() {
		return sqlSession.selectOne("CS.private.countBoard");
	}
	
	
	@Override
	public List selectBoardDetail(Map<String, Object> dataMap) {
		List<CS_P001_D003DAO> dataList = null;
		dataList = sqlSession.selectList("CS.private.selectBoardDetail", dataMap);
		System.out.println("da0333333333333333333333333333333333" + dataList);
		return dataList;
	}
	@Override
	public void insertcomment(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("CS.private.insertcomment", datahMap);
	}
	
	@Override
	public void deletecomment(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("CS.private.deletecomment", datahMap);
	}
	
	@Override
	public List<CS_P001_D003VO> selectcomment(Map<String, Object> searchMap) throws DataAccessException {
		List<CS_P001_D003VO> list = sqlSession.selectList("CS.private.selectcomment", searchMap);
		return list;
	}
		
		

}
