package project.Main.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Main.P001.D001.vo.M_P001_D001VO;

public interface M_P001_D001Service {
	public List<M_P001_D001VO> newProduct(Map<String, Object> searchMap) throws DataAccessException;
}
