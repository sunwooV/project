package project.Etc.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D001.dao.CS_P001_D001DAO;
import project.CS.P001.D001.service.CS_P001_D001Service;
import project.Etc.P001.D001.dao.E_P001_D001DAO;
import project.FleaMarket.P001.D001.dao.F_P001_D001DAO;
import project.FleaMarket.P001.D001.vo.F_P001_D001VO;

@Service("E_P001_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class E_P001_D001ServiceImpl implements E_P001_D001Service {
	@Autowired
	private E_P001_D001DAO e_p001_d001DAO;

}
