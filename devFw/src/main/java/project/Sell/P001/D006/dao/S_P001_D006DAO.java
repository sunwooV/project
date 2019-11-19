package project.Sell.P001.D006.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface S_P001_D006DAO {
	public void insertBid(Map<String, Object> datahMap) throws DataAccessException;
	public void updateProduct(Map<String, Object> datahMap) throws DataAccessException;
}
