package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class role {
	@Id
	@Column(name = "role_id")
	private long role_id;
	
	@Column(name = "role_name")
	private String role_name;
	
	@OneToMany(mappedBy = "role")
	private Collection<users> users;

	public long getRole_id() {
		return role_id;
	}

	public void setRole_id(long role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public Collection<users> getUsers() {
		return users;
	}

	public void setUsers(Collection<users> users) {
		this.users = users;
	}
	
	
	
}
