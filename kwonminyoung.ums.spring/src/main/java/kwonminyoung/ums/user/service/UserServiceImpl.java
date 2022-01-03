package kwonminyoung.ums.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonminyoung.ums.user.dao.UserDao;
import kwonminyoung.ums.user.domain.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	@Override
	public List<User> listUsers(){
		return userDao.getUsers();
	}
	
	@Override
	public User findUser(int userNo){
		return userDao.getUser(userNo);
	}
	
	@Override
	public boolean join(String userName){
		return userDao.addUser(userName)>0;
	}
	
	@Override
	public boolean correctUser(User user){
		return userDao.updateUser(user)>0;
	}
	
	@Override
	public boolean secede(int userNo){
		return userDao.delUser(userNo)>0;
	}
}