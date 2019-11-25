package project.Product.P001.D001.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("P_P001_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class P_P001_D001ServiceImpl {

}
