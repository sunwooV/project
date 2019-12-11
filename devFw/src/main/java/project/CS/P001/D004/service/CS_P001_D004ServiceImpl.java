package project.CS.P001.D004.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D004.dao.CS_P001_D004DAO;
import project.CS.P001.D004.vo.CS_P001_D004VO;


@Service("CS_P001_D004Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CS_P001_D004ServiceImpl implements CS_P001_D004Service{
	
	@Autowired
	private CS_P001_D004DAO CS_p001_d004DAO;
	
	// 게시판 글 작성
	@Override
	public int insertboard(CS_P001_D004VO board) throws Exception {
		return CS_p001_d004DAO.insertboard(board);
	}

	@Override
	public int deleteboard(CS_P001_D004VO board) throws Exception {
		return CS_p001_d004DAO.deleteboard(board);
		
	}

	@Override
	public void updateboard(Map<String, Object> dataMap) throws Exception {
		CS_p001_d004DAO.updateboard(dataMap);
		
	}


	}
