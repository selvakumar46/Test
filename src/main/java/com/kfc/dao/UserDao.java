package com.kfc.dao;

import com.kfc.model.User;

public interface UserDao {
	public boolean insertUser(User user);

	public User validateUser(String logMail, Long logNumber);

	public User updateUser(User user1);

	public User delUser(User deleteUser);
}
