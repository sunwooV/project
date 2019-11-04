package project.Main.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Main.P001.D001.vo.M_P001_D001_VO;
import project.Main.P001.D001.dao.M_P001_D001_DAO;

@Service("M_P001_D001_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class M_P001_D001_ServiceImpl implements M_P001_D001_Service {
	@Autowired
	private M_P001_D001_DAO M_P001_D001_DAO;
	
	@Override
	public List<M_P001_D001_VO> newProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D001_VO> list =  M_P001_D001_DAO.newProduct(searchMap); 
		return list;
	}
}
