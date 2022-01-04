package com.kiosk.HSservice;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kiosk.HSdao.PosMainDao;
import com.kiosk.HSvo.ManagerVo;

@Repository
public class PosMainServiceImpl implements PosMainService{
	
	@Inject
	private PosMainDao posMainDao;
	
	@Override
	public ManagerVo managerLogin(ManagerVo managerVo) {

		ManagerVo loginCheck = posMainDao.managerLogin(managerVo);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
		if(loginCheck != null && loginCheck.getPw().length() < 30 && loginCheck.getPw().equals(managerVo.getPw())) {
			
			return loginCheck;
			
		} else if (loginCheck != null && loginCheck.getPw().length() >= 30 && encoder.matches(managerVo.getPw(),loginCheck.getPw())) {
				return loginCheck;
		} else {
			return null;
		}
	}
}
