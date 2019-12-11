package project.Customers.P002.D006.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface C_P002_D006DAO {
	 public List selectAllqnaList(Map<String, Object> searchMap) throws DataAccessException;
	 public void deleteQna(Map<String, Object> datahMap) throws DataAccessException;
}
