package project.Main.P001.D001.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("M_P001_D001_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class M_P001_D001_ServiceImpl implements M_P001_D001_Service {

}
