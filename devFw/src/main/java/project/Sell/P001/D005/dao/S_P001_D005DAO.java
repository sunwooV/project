package project.Sell.P001.D005.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface S_P001_D005DAO {
	public void updateProduct(Map<String, Object> datahMap) throws DataAccessException;
	public void updateTag(Map<String, Object> datahMap) throws DataAccessException;
}
