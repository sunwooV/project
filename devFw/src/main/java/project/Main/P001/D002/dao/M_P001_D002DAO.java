package project.Main.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Main.P001.D001.vo.M_P001_D001VO;
import project.Main.P001.D002.vo.M_P001_D002VO;

public interface M_P001_D002DAO {
	public List<M_P001_D002VO> reusedList(Map<String, Object> searchMap) throws DataAccessException;
	public List<M_P001_D002VO> auctionList(Map<String, Object> searchMap) throws DataAccessException;
}
