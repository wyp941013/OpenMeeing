package com.wyp.mybatis.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 消息
 * */
public class Message {
	
	private long id;		//编号
	private long meetId;	//对应会议~
	private long manager;	//组织者，即信息发送的人~
	private long userId;	//对应用户~
	private Date proTime;	//发送时间~
	private Date returnTime;//用户回复时间
	private int oryes;		//来与否,0不到，1到~
	private int isScanF;	//用户是否浏览,0表示否，1表示是~默认值是0
	private int isScanM;	//管理是否浏览,0表示否，1表示是~默认值是1
	private String sendInfo;//发送信息~
	private String getInfo;	//回复信息~
	
	private User user;
	private Set<Meets> meet = new HashSet<Meets>();
	
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Meets> getMeet() {
		return meet;
	}
	public void setMeet(Set<Meets> meet) {
		this.meet = meet;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getMeetId() {
		return meetId;
	}
	public void setMeetId(long meetId) {
		this.meetId = meetId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public Date getProTime() {
		return proTime;
	}
	public void setProTime(Date proTime) {
		this.proTime = proTime;
	}
	public Date getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}
	public int getOryes() {
		return oryes;
	}
	public void setOryes(int oryes) {
		this.oryes = oryes;
	}
	
	public int getIsScanF() {
		return isScanF;
	}
	public void setIsScanF(int isScanF) {
		this.isScanF = isScanF;
	}
	public int getIsScanM() {
		return isScanM;
	}
	public void setIsScanM(int isScanM) {
		this.isScanM = isScanM;
	}
	public String getSendInfo() {
		return sendInfo;
	}
	public void setSendInfo(String sendInfo) {
		this.sendInfo = sendInfo;
	}
	public String getGetInfo() {
		return getInfo;
	}
	public void setGetInfo(String getInfo) {
		this.getInfo = getInfo;
	}
	public long getManager() {
		return manager;
	}
	public void setManager(long manager) {
		this.manager = manager;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", meetId=" + meetId + ", manager="
				+ manager + ", userId=" + userId + ", proTime=" + proTime
				+ ", returnTime=" + returnTime + ", oryes=" + oryes
				+ ", isScanF=" + isScanF + ", isScanM=" + isScanM
				+ ", sendInfo=" + sendInfo + ", getInfo=" + getInfo + ", user="
				+ user + ", meet=" + meet + "]";
	}
	
	
}
