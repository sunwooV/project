package project.Customers.P002.D007.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface C_P002_D007DAO {

	List selectAllreviewList(String memberid) throws DataAccessException;

}
