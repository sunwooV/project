package project.Sell.P001.D008.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Sell.P001.D008.vo.S_P001_D008VO;

public interface S_P001_D008Service {
	public List<S_P001_D008VO> auction_date_check() throws DataAccessException;
	public void failAuction(Map<String, Object> datahMap) throws Exception;
	public void winAuction(Map<String, Object> datahMap) throws Exception;
}
