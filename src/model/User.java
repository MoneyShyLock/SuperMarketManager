package model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="user")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;//主键
	private String username;
	private String password;
	private Integer gender;
	private Integer age;
	private String phone;
	private String isadmin;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(Integer id, String username, String password, Integer gender, Integer age, String phone,
			String isadmin) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.isadmin = isadmin;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", gender=" + gender + ", age="
				+ age + ", phone=" + phone + ", isadmin=" + isadmin + "]";
	}
	
	

}
