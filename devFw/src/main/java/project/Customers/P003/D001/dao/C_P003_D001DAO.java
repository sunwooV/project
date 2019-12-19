package project.Customers.P003.D001.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface C_P003_D001DAO {
	public void changeSeller(Map<String, Object> datahMap) throws DataAccessException;
	public void fleaUpdateSeller(Map<String, Object> datahMap) throws DataAccessException;
}
