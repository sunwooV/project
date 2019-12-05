package project.Buy.P001.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Buy.P001.D003.dao.B_P001_D003DAO;
import project.Buy.P001.D003.vo.B_P001_D003VO;

@Service("B_P001_D003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P001_D003ServiceImpl implements B_P001_D003Service{
	@Autowired
	private B_P001_D003DAO b_p001_d003DAO;

	//장바구니 품목조회 
	@Override
	public List<B_P001_D003VO> selectCart(Map<String, Object> searchMap) throws DataAccessException {
		List<B_P001_D003VO> list = b_p001_d003DAO.selectCart(searchMap);
		return list;
	}

	//장바구니에 품목 추가
	@Override
	public void insertCart(Map<String, Object> searchMap) throws DataAccessException {
		b_p001_d003DAO.insertCart(searchMap);
		
	}

	//장바구니 상품 수정
	@Override
	public void updateCart(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	//장바구니 상품 삭제
	@Override
	public void deleteCart(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}
}
