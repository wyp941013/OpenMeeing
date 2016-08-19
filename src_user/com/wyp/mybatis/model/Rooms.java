/**
 * 
 */
package com.wyp.mybatis.model;
import java.io.Serializable;
import java.sql.Time;
import java.util.HashSet;
import java.util.Set;

/**
 * @author 王云鹏
 * @date 2015-3-12
 */

public class Rooms implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private long roomId;  //会议室编号
	private String roomNumber;//会议室房间号  
	private Time openTime; //开放时间
	private Time closeTime;    // 关闭时间
	private int isEmpty;      //是否空闲
	private String isOpen;     //是否开放
	private String roomManager; //会议室管理人 
	
	public long getRoomId() {
		return roomId;
	}
	public void setRoomId(long roomId) {
		this.roomId = roomId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public Time getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Time openTime) {
		this.openTime = openTime;
	}
	public Time getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(Time closeTime) {
		this.closeTime = closeTime;
	}
	public int getIsEmpty() {
		return isEmpty;
	}
	public void setIsEmpty(int isEmpty) {
		this.isEmpty = isEmpty;
	}
	public String getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}
	public String getRoomManager() {
		return roomManager;
	}
	public void setRoomManager(String roomManager) {
		this.roomManager = roomManager;
	}
	
    
}
