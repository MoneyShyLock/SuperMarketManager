package dao;

import java.util.List;

import model.User;

public interface UserDao {
	public int insert(User user);
	public void delete(User user);
	public void update(User user);
	public User findById(User user);
	public List<User> findAll();
	public List<User> findByName(User user) throws Exception;
}
