package project.Etc.P002.D001.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("E_P002_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class E_P002_D001ServiceImpl implements E_P002_D001Service {


}
