package project.CS.P001.D004.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D004.vo.CS_P001_D004VO;





@Repository("CS_P001_D004DAO")
public class CS_P001_D004DAOImpl implements CS_P001_D004DAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	@Override
	@Transactional
	public int insertboard(CS_P001_D004VO board) throws Exception{
		return sqlsession.insert("CS.boardWrite.insertboard", board);
	}
	

}
