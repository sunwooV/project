package project.Etc.P002.D002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.Customers.P007.D001.dao.C_P007_D001DAO;
import project.Customers.P007.D001.vo.C_P007_D001VO;
import project.Etc.P002.D002.dao.E_P002_D002DAO;
import project.Etc.P002.D002.vo.E_P002_D002VO;

@Service("E_P002_D002Service")
public class E_P002_D002ServiceImpl implements E_P002_D002Service{
	@Autowired
	private E_P002_D002DAO e_p002_d002dao;

	@Override
	public List<E_P002_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<E_P002_D002VO> list =  e_p002_d002dao.searchList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 RowMap
			if("I".equals(str)) { // 추가
				e_p002_d002dao.insertData(row);
			}else if("U".equals(str)) { // 수정
				e_p002_d002dao.updateData(row);
			}else if("D".equals(str)) { // 삭제
				e_p002_d002dao.deleteData(row);
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
