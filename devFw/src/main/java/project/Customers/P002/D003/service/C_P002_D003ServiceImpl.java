package project.Customers.P002.D003.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("C_P002_D003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D003ServiceImpl implements C_P002_D003Service{

	}
