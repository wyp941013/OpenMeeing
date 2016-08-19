/**
 * 
 */
package com.wyp.mybatis.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author 王云鹏
 * @date 2015-1-29
 */
public class FileUploadBean {
     private long fileId;
     private String fileName;
	 private MultipartFile upFile;
	 private byte[] upFileByte;
	 private long meet_id;
	 
	 
	public byte[] getUpFileByte() {
		return upFileByte;
	}

	public void setUpFileByte(byte[] upFileByte) {
		this.upFileByte = upFileByte;
	}

	public long getFileId() {
		return fileId;
	}

	public void setFileId(long fileId) {
		this.fileId = fileId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getMeet_id() {
		return meet_id;
	}

	public void setMeet_id(long meet_id) {
		this.meet_id = meet_id;
	}

	public MultipartFile getUpFile() {
		return upFile;
	}

	public void setUpFile(MultipartFile upFile) {
		this.upFile = upFile;
	}

	
	 
	
	
}
