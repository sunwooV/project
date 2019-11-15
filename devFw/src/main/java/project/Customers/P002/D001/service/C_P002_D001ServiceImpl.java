package project.Customers.P002.D001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D001.dao.C_P002_D001DAO;

@Service("C_P002_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D001ServiceImpl implements C_P002_D001Service{
	@Autowired
	private C_P002_D001DAO c_p002_d001DAO;

	}
