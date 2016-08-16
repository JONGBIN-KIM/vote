package com.user.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.user.domain.UserVO;
import com.user.service.UserService;

@Controller
public class UserContoller {

	@Inject
	UserService userService;

//	@RequestMapping("/login")
//	public int joinUser(UserVO uservo) {
//
//		return userService.userJoin(uservo);
//	}

	@RequestMapping(value = "/snsLogin", method = RequestMethod.GET)
	public String snsLogin() {
		return "snsLogin";
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public void userLogin(UserVO uservo, Model model) throws Exception {
//		System.out.println(userService.checkRegisterdUser(uservo));
		if(userService.checkRegisteredUser(uservo)==0){
//			userService.userJoin(uservo);
		}
	}
}