package project.Customers.P002.D006.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface C_P002_D006DAO {
	 public List selectAllqnaList(String memberid) throws DataAccessException;

}
