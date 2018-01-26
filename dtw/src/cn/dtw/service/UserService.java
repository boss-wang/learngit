package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.User;

public interface UserService {
	//查询账户是否存在，存在则将用户信息返回
	public User getUserByAccount(User user);
	//查询所有用户
	public List<User> getAllUser();
}
