package com.user.service;

import com.user.domain.UserVO;

public interface UserService {
	public int joinSnsUser(UserVO uservo);
	public int checkRegisteredUser(UserVO uservo);
	public int duplCheck(UserVO uservo);
	public int joinUser(UserVO uservo);
	public UserVO login(UserVO uservo);
}
