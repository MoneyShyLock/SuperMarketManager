package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.impl.UserDaoImpl;
import model.User;
import service.UserService;
@Service(value="userServiceImpl")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDaoImpl userDaoImpl;

	@Override
	public int  insert(User user) {
		return userDaoImpl.insert(user);
	}

	@Override
	public void delete(User user) {
		userDaoImpl.delete(user);
		
	}

	@Override
	public void update(User user) {
		userDaoImpl.update(user);
		
	}

	@Override
	@Transactional(readOnly=true)
	public User findById(User user) {
		// TODO Auto-generated method stub
		return userDaoImpl.findById(user);
	}

	@Override
	@Transactional(readOnly=true)
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDaoImpl.findAll();
	}

	@Override
	@Transactional(readOnly=true)
	public List<User> findByUsername(User user) {
		return userDaoImpl.findByName(user);
	}

}
