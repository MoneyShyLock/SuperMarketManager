package dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import dao.UserDao;
import model.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private HibernateTemplate temp;

	@Override
	public int insert(User user) {
		Integer id = (Integer)temp.save(user);
		
		return id;

	}

	@Override
	public void delete(User user) {
		temp.save(user);

	}

	@Override
	public void update(User user) {
		temp.update(user);

	}

	@Override
	public User findById(User user) {
		List<User> list = (List<User>) temp.find("from User where id=?", user.getId());
		return list.get(0);
	}

	@Override
	public List<User> findAll() {
		List<User> list = (List<User>) temp.find("from User");
		return list;
	}

	@Override
	public List<User> findByName(User user){
		List<User> list = (List<User>) temp.find("from User where username like ?", "%"+user.getUsername()+"%");
		if (!list.isEmpty())
			return list;
		return null;
	}

}
