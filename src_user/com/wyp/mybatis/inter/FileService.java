package com.wyp.mybatis.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wyp.mybatis.model.FileUploadBean;

@Repository  
@Transactional  
public interface FileService {

	 	public void createFile(FileUploadBean upFile);  
	  
	    public int deleteFileByFileId(@Param("fileId") long fileId);  
	  
	    public int updateFileData(@Param("fileId") long photoId, @Param("upFileByte") byte[] upFile);  
	  
	    public FileUploadBean getFileByFileId(@Param("fileId") long fileId); 
	    
	    public List<FileUploadBean> getAllFilesByMeetId(@Param("meet_id") long meet_id);
}
