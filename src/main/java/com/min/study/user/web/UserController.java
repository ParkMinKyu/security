package com.min.study.user.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.study.core.util.ShaEncoder;
import com.min.study.user.dao.UserDaoService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name="shaEncoder")
	private ShaEncoder encoder;

	@Resource(name="userDaoService")
	private UserDaoService dao;
	
	@RequestMapping("/user/loginPage")
	public String loginPage(){
		return "/user/loginPage";
	}

	@RequestMapping("/user/denied")
	public String denied(Model model, Authentication auth, HttpServletRequest req){
		AccessDeniedException ade = (AccessDeniedException) req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		logger.info("ex : {}",ade);
		model.addAttribute("auth", auth);
		model.addAttribute("errMsg", ade);
		return "/user/denied";
	}
	
	@RequestMapping(value = "/user/insertUser",method=RequestMethod.POST)
	public String insertUser(@RequestParam("email")String email, @RequestParam("passwd")String passwd, @RequestParam("authority")String authority){
		String dbpw = encoder.saltEncoding(passwd, email);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("email", email);
		paramMap.put("passwd", dbpw);
		paramMap.put("authority", authority);
		int result = dao.insertUser(paramMap);
		logger.info("result ===> {}", result);
		return "/user/loginPage";
	}

}
