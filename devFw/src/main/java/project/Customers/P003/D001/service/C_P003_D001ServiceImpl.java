package project.Customers.P003.D001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Customers.P003.D001.dao.C_P003_D001DAO;

@Service("C_P003_D001Service")
public class C_P003_D001ServiceImpl implements C_P003_D001Service {
	@Autowired
	private C_P003_D001DAO C_P003_D001DAO;
}
