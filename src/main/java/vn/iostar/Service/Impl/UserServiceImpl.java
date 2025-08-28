package vn.iostar.Service.Impl;

import vn.iostar.Service.UserService;
import vn.iostar.dao.UserDao;
import vn.iostar.dao.impl.UserDaoImpl;
import vn.iostar.model.User;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();
	//viết các hàm đã định nghĩa bên interface service tại đây
	@Override
	public User login(String username, String password) {
		User user = this.get(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}
		return null;
	}
	@Override
	public User get(String username) {
		return userDao.get(username);
	}

}
