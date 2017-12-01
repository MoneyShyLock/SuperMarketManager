package service;

import java.util.List;

import model.User;

public interface UserService {
	public int insert(User user) throws Exception;

	public void delete(User user) throws Exception;

	public void update(User user) throws Exception;

	public User findById(User user) throws Exception;

	public List<User> findAll() throws Exception;

	public List<User> findByUsername(User user) throws Exception;

}
