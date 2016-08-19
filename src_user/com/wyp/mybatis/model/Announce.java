/**
 * 
 */
package com.wyp.mybatis.model;

import java.util.Date;

/**
 * @author 王云鹏
 * @date 2015-1-29
 */
public class Announce {

	private int announceId;//通告id
	private String announceTitle;//通告标题
	private Date produceTime;//发布时间
	private String announceInfo;//通告信息
	public int getAnnounceId() {
		return announceId;
	}
	public void setAnnounceId(int announceId) {
		this.announceId = announceId;
	}
	public String getAnnounceTitle() {
		return announceTitle;
	}
	public void setAnnounceTitle(String announceTitle) {
		this.announceTitle = announceTitle;
	}
	public Date getProduceTime() {
		return produceTime;
	}
	public void setProduceTime(Date produceTime) {
		this.produceTime = produceTime;
	}
	public String getAnnounceInfo() {
		return announceInfo;
	}
	public void setAnnounceInfo(String announceInfo) {
		this.announceInfo = announceInfo;
	}
	@Override
	public String toString() {
		return "Announce [announceId=" + announceId + ", announceTitle="
				+ announceTitle + ", produceTime=" + produceTime
				+ ", announceInfo=" + announceInfo + "]";
	}
	
	
	
	
	
}
