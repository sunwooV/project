package project.FleaMarket.P002.D007.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.FleaMarket.P002.D007.dao.F_P002_D007DAO;
import project.FleaMarket.P002.D007.vo.F_P002_D007VO;


@Service("F_P002_D007Service")
public class F_P002_D007ServiceImpl implements F_P002_D007Service{
	@Autowired
	private F_P002_D007DAO F_P002_d007dao;

	@Override
	public List<F_P002_D007VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D007VO> list =  F_P002_d007dao.searchList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수ㅜ
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 RowMap
			if("U".equals(str)) { // 수정
				F_P002_d007dao.updateData(row);
			}else if("D".equals(str)) { // 삭제
				F_P002_d007dao.deleteData(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}		
		return row;
	}	

}

