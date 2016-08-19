/**
 * 
 */
package com.wyp.mybatis.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * @author 王云鹏
 * @date 2015-1-28
 */

public class Meets {

	private long meetId;//会议编号
	private String meetTitle;//会议主题
	private String meetManager;//会议预约人（主持）。。
	private String meetPosition;//会议等级
	private String meetType;//会议类型
	private Date meetProTime;//发布时间yyyy-mm-dd hh:mm:ss
	private String meetTime;//会议日期 yyyy-mm-dd
	private String meetStartTime;//会议开始时间 hh:mm:ss
	private String meetEndTime;//会议结束时间 hh:mm:ss
	private int usersNum;//会议人员数量
	private String meetInfo;//会议信息
    private long room_id; //对应会议室编号
    private String applyUser;//会议申请人
 
    private Set<Rooms> room = new HashSet<Rooms>();
    
    
	public Set<Rooms> getRoom() {
		return room;
	}

	public void setRoom(Set<Rooms> room) {
		this.room = room;
	}

	public String getApplyUser() {
		return applyUser;
	}

	public void setApplyUser(String applyUser) {
		this.applyUser = applyUser;
	}

	public long getRoom_id() {
		return room_id;
	}

	public void setRoom_id(long room_id) {
		this.room_id = room_id;
	}

	public long getMeetId() {
		return meetId;
	}

	public void setMeetId(long meetId) {
		this.meetId = meetId;
	}

	public String getMeetTitle() {
		return meetTitle;
	}

	public void setMeetTitle(String meetTitle) {
		this.meetTitle = meetTitle;
	}
	
	public Date getMeetProTime() {
		return meetProTime;
	}

	public void setMeetProTime(Date meetProTime) {
		this.meetProTime = meetProTime;
	}

	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	public String getMeetStartTime() {
		return meetStartTime;
	}

	public void setMeetStartTime(String meetStartTime) {
		this.meetStartTime = meetStartTime;
	}

	public String getMeetEndTime() {
		return meetEndTime;
	}

	public void setMeetEndTime(String meetEndTime) {
		this.meetEndTime = meetEndTime;
	}

	public String getMeetManager() {
		return meetManager;
	}

	public void setMeetManager(String meetManager) {
		this.meetManager = meetManager;
	}

	public String getMeetPosition() {
		return meetPosition;
	}

	public void setMeetPosition(String meetPosition) {
		this.meetPosition = meetPosition;
	}

	public String getMeetType() {
		return meetType;
	}

	public void setMeetType(String meetType) {
		this.meetType = meetType;
	}

	public int getUsersNum() {
		return usersNum;
	}

	public void setUsersNum(int usersNum) {
		this.usersNum = usersNum;
	}

	public String getMeetInfo() {
		return meetInfo;
	}

	public void setMeetInfo(String meetInfo) {
		this.meetInfo = meetInfo;
	}

	public Meets(){
		super();
	}

	@Override
	public String toString() {
		return "Meets [meetId=" + meetId + ", meetTitle=" + meetTitle
				+ ", meetManager=" + meetManager + ", meetPosition="
				+ meetPosition + ", meetType=" + meetType + ", meetProTime="
				+ meetProTime + ", meetTime=" + meetTime + ", meetStartTime="
				+ meetStartTime + ", meetEndTime=" + meetEndTime
				+ ", usersNum=" + usersNum + ", meetInfo=" + meetInfo
				+ ", room_id=" + room_id + ", applyUser=" + applyUser + "]";
	}

	
}
