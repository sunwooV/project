package project.Customers.P002.D002.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("C_P002_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D002ServiceImpl implements C_P002_D002Service{

	}
