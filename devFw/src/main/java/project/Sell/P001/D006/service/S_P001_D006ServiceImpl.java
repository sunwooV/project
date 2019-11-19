package project.Sell.P001.D006.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Sell.P001.D006.dao.S_P001_D006DAO;

@Service("S_P001_D006Service")
public class S_P001_D006ServiceImpl implements S_P001_D006Service {
	@Autowired
	private S_P001_D006DAO S_P001_D006DAO;
	
	@Override
	public void insertBid(Map<String, Object> datahMap) throws Exception {
		S_P001_D006DAO.insertBid(datahMap);
	}
	
	@Override
	public void updateProduct(Map<String, Object> datahMap) throws Exception {
		S_P001_D006DAO.updateProduct(datahMap);
	}
}
