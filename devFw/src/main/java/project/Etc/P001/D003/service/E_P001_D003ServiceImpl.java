package project.Etc.P001.D003.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("E_P001_D003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class E_P001_D003ServiceImpl implements E_P001_D003Service {


}
