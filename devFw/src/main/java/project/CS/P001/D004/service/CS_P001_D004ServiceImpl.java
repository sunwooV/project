package project.CS.P001.D004.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("CS_P001_D004Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CS_P001_D004ServiceImpl implements CS_P001_D004Service{


	}
