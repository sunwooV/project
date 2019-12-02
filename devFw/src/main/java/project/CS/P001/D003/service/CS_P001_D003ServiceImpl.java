package project.CS.P001.D003.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.dao.CS_P001_D003DAO;





@Service("CS_P001_D003Service")
@Transactional(propagation = Propagation.REQUIRED)

public class CS_P001_D003ServiceImpl implements CS_P001_D003Service {
	@Inject
	private CS_P001_D003DAO cs_p001_d003_DAO;
	
	

    
	@Override
	public List privatelist(PagingVO vo) throws DataAccessException {
		List privatelist = null;
		privatelist = cs_p001_d003_DAO.privatelist(vo);
		return privatelist;
	}

	public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException {

//		cs_p001_d001DAO.updateViewCnt(param); //게시글 조횟수 늘리기가 선행되어야 한다. 
		List dataList = null;
		dataList = cs_p001_d003_DAO.selectBoardDetail(dataMap);
		System.out.println("service22222222222222222222222222" + dataMap);
		return dataList;
	}

	
	@Override
	public int countBoard() {
		return cs_p001_d003_DAO.countBoard();

	}

	
}
