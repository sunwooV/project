package project.CS.P001.D005.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("CS_P001_D005Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CS_P001_D005ServiceImpl implements CS_P001_D005Service{


	}
