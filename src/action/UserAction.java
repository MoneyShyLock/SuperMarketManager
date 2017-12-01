package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import model.User;
import service.impl.UserServiceImpl;

@Controller(value = "useraction")
@Scope(value = "request")
public class UserAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private String msg;// 消息
	private Map<String, Object> session;
	private List<User> list;

	@Autowired()
	private UserServiceImpl userServiceImpl;

	// 登录
	@SuppressWarnings("unused")
	public String doLogin() {
		if (user != null) {
			if (user.getUsername().equals("")) {
				msg = "0";// 用户名为空
			} else if (user.getPassword().equals("")) {
				msg = "1";// 密码为空
			} else {
				List<User> findUserList = userServiceImpl.findByUsername(user);
				User findUser=findUserList.get(0);
				if (findUser != null) {
					// 进一步判断密码
					if (findUser.getPassword().equals(user.getPassword())) {
						// 允许登录
						session.put("sessionUser", findUser);
						msg = "3";
					} else {
						msg = "2";// 用户名或密码错误
					}

				} else {
					msg = "2";// 用户名或密码错误
				}
			}
		}
		return "success";
	}

	// 显示所有用户
	public String showAllUser() {
		List<User> listUser = userServiceImpl.findAll();
		list = listUser;
		return SUCCESS;
	}

	// 通过用户名查询用户
	public String findUserName() {
		List<User> findUser = userServiceImpl.findByUsername(user);
		list=findUser;
		System.out.println(list);
		return SUCCESS;

	}
	// 通过id查询用户
		public String findById() {
			System.out.println("---------"+user.getId());
			return SUCCESS;

		}
	// 修改用户
		public String updateUser() {
			userServiceImpl.update(user);
			return SUCCESS;

		}

	// 添加用户
	public String addUser() {
		
		int id = userServiceImpl.insert(user);
		if (id != 0) {
			return SUCCESS;// 添加成功
		} else
			return ERROR;// 添加失败

	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public UserServiceImpl getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(UserServiceImpl userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;

	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}


}
