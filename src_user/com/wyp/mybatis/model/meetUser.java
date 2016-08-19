/**
 * 
 */
package com.wyp.mybatis.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


/**
 * @author Õı‘∆≈Ù
 * @date 2015-1-28
 */

public class meetUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private long user_id;
	private long meet_id;
	private Set<User> user = new HashSet<User>();
	
	
	public Set<User> getUser() {
		return user;
	}
	public void setUser(Set<User> user) {
		this.user = user;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public long getMeet_id() {
		return meet_id;
	}
	public void setMeet_id(long meet_id) {
		this.meet_id = meet_id;
	}
	@Override
	public String toString() {
		return "meetUser [id=" + id + ", user_id=" + user_id + ", meet_id="
				+ meet_id + "]";
	}
	
}
