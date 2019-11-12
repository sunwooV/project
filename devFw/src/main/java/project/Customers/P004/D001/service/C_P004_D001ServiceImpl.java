package project.Customers.P004.D001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.Customers.P004.D001.dao.C_P004_D001DAO;
import project.Customers.P004.D001.vo.C_P004_D001VO;


@Service("C_P004_D001Servic")
public class C_P004_D001ServiceImpl implements C_P004_D001Service{
	@Autowired
	private C_P004_D001DAO c_p004_d001dao;

	@Override
	public List<C_P004_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P004_D001VO> list =  c_p004_d001dao.searchList(searchMap); 
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
				c_p004_d001dao.updateData(row);
			}else if("D".equals(str)) { // 삭제
				c_p004_d001dao.deleteData(row);
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
