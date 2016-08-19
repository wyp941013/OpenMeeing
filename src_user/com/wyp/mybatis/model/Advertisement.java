/**
 * 
 */
package com.wyp.mybatis.model;

import java.util.Date;

/**
 * @author 王云鹏
 * @date 2015-1-29
 */
public class Advertisement {

	private int advertiseId;//广告编号
	private String company; //发布公司
	private String advertiseTitle;//广告标题
	private String advertisePic;//广告附图
	private String adveritseInfo;//广告信息
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	
	public int getAdvertiseId() {
		return advertiseId;
	}
	public void setAdvertiseId(int advertiseId) {
		this.advertiseId = advertiseId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAdvertiseTitle() {
		return advertiseTitle;
	}
	public void setAdvertiseTitle(String advertiseTitle) {
		this.advertiseTitle = advertiseTitle;
	}
	public String getAdvertisePic() {
		return advertisePic;
	}
	public void setAdvertisePic(String advertisePic) {
		this.advertisePic = advertisePic;
	}
	public String getAdveritseInfo() {
		return adveritseInfo;
	}
	public void setAdveritseInfo(String adveritseInfo) {
		this.adveritseInfo = adveritseInfo;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "Advertisement [advertiseId=" + advertiseId + ", company="
				+ company + ", advertiseTitle=" + advertiseTitle
				+ ", advertisePic=" + advertisePic + ", adveritseInfo="
				+ adveritseInfo + ", startTime=" + startTime + ", endTime="
				+ endTime + "]";
	}
	
	
}
