package project.CS.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D001.dao.CS_P001_D001DAO;
import project.CS.P001.D001.vo.PagingVO;

@Service("CS_P001_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CS_P001_D001ServiceImpl implements CS_P001_D001Service {
	@Autowired
	private CS_P001_D001DAO cs_p001_d001DAO;

	@Override
	public List listEvent(PagingVO vo) throws DataAccessException {
		List eventList = null;
		eventList = cs_p001_d001DAO.selectAllEventList(vo);
		return eventList;
	}

	public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException {

		cs_p001_d001DAO.updateCNT(dataMap);

//		cs_p001_d001DAO.updateViewCnt(param); //게시글 조횟수 늘리기가 선행되어야 한다. 
		List dataList = null;
		dataList = cs_p001_d001DAO.selectBoardDetail(dataMap);
		System.out.println("service22222222222222222222222222" + dataMap);
		return dataList;
	}

	@Override
	public int countBoard() {
		return cs_p001_d001DAO.countBoard();

	}

	@Override
	public List listDelivery(PagingVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
