package com.wyp.mybatis.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.wyp.mybatis.inter.FileService;
import com.wyp.mybatis.model.FileUploadBean;
import com.wyp.mybatis.model.Meets;

/**
* @ClassName: UploadHandleServlet
* @Description: TODO(这里用一句话描述这个类的作用)
* @author: 孤傲苍狼
* @date: 2015-1-3 下午11:35:50
*
*/ 
@Controller
@RequestMapping("/file")
public class FileController extends HttpServlet {

	@Autowired
	FileService fileService;
	/**
	 * 此部分暂时未使用，是用来上传文件到本地服务器的
	 */
	private static final long serialVersionUID = 1L;
	private static final String uploadFilePath = "e:\\mybatisTest\\OpenMeeting\\WebContent\\WEB-INF\\upload";  
	@RequestMapping("/uploadfile")
	public ModelAndView add_action(ModelMap model,FileUploadBean upfile) {  
		try {  
		        MultipartFile uploadFile = upfile.getUpFile();
		        String filename = uploadFile.getOriginalFilename();  
		        InputStream is = uploadFile.getInputStream();  
		        // 如果服务器已经存在和上传文件同名的文件，则输出提示信息  
		        File tempFile = new File(uploadFilePath + filename);  
		        if (tempFile.exists()) {  
		            boolean delResult = tempFile.delete();  
		            System.out.println("删除已存在的文件：" + delResult);  
		        }  
		        // 开始保存文件到服务器  
		        if (!filename.equals("")) {  
		            FileOutputStream fos = new FileOutputStream(uploadFilePath + filename);  
		            byte[] buffer = new byte[8192]; // 每次读8K字节  
		            int count = 0;  
		            // 开始读取上传文件的字节，并将其输出到服务端的上传文件输出流中  
		            while ((count = is.read(buffer)) > 0) {  
		                fos.write(buffer, 0, count); // 向服务端文件写入字节流  
		            }  
		            fos.close(); // 关闭FileOutputStream对象  
		            is.close(); // InputStream对象  
		        }  
		        
		    } catch (FileNotFoundException e) {  
		        e.printStackTrace();  
		    } catch (IOException e) {  
		        e.printStackTrace();  
		    }  
			ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/user_fileDownload.jsp"));
			return mav;
		}  
	
	

    /** 
     * 新增 - 提交 – 保存文件到数据库 
     * @throws IOException 
     */  
    @RequestMapping(value = "upFileTodata")  
    public ModelAndView upFileTodata(ModelMap model, FileUploadBean upfile) throws IOException {  
        InputStream is = upfile.getUpFile().getInputStream();  
        byte[] studentPhotoData = new byte[(int) upfile.getUpFile().getSize()];  
        is.read(studentPhotoData);  
        String fileName = upfile.getUpFile().getOriginalFilename();  
        FileUploadBean fileUploadBean = new FileUploadBean();  
        fileUploadBean.setUpFileByte(studentPhotoData);  
        fileUploadBean.setFileName(fileName);  
        fileUploadBean.setMeet_id(upfile.getMeet_id());
        this.fileService.createFile(fileUploadBean);  
        ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/user_fileDownload.jsp"));
		return mav;
    }  

    

    @RequestMapping(value = "downloadFileFromdata")  
    public void downloadFileFromdata( final HttpServletResponse response,final HttpServletRequest request) throws IOException{  
    	String id=request.getParameter("fileId");
    	long fileId =1;
    	if(id!=""){
    		fileId = Long.parseLong(id);
    	}
    	FileUploadBean entity = this.fileService.getFileByFileId(fileId);  
        byte[] data = entity.getUpFileByte();  
        String fileName = entity.getFileName();  
        fileName = URLEncoder.encode(fileName, "UTF-8");  
        response.reset();  
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  
        response.addHeader("Content-Length", "" + data.length);  
        response.setContentType("application/octet-stream;charset=UTF-8");  
        OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());  
        outputStream.write(data);  
        outputStream.flush();  
        outputStream.close(); 
    }  

    
    @RequestMapping(value = "getAllFiles")  
    public ModelAndView getAllFiles(final HttpServletResponse response,final HttpServletRequest request) throws IOException{  
    	String Id = request.getParameter("meetId");
    	long meetId = 1;
    	if(Id!=""){
    		meetId = Long.parseLong(Id);
    	}
    	List<FileUploadBean> filelist=this.fileService.getAllFilesByMeetId(meetId);
    	ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/uploadFile.jsp"));
    	request.getSession().setAttribute("filelist", filelist);
    	request.getSession().setAttribute("meetId", meetId);
    	
 		return mav;
    }
    
    
    @RequestMapping(value = "getUserFiles")  
    public ModelAndView getUserFiles(final HttpServletResponse response,final HttpServletRequest request) throws IOException{  
    	Object sess = request.getSession().getAttribute("listmeet");
    	List<Meets> list1 = (List<Meets>)sess;
    	List<FileUploadBean> filelist= new ArrayList<FileUploadBean>();
    	for(Meets meet:list1){
    		List<FileUploadBean> ll= this.fileService.getAllFilesByMeetId(meet.getMeetId());
    		for(FileUploadBean fil:ll){
    		filelist.add(fil);
    		}
    	}
    	ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/user_fileDownload.jsp"));
    	request.getSession().setAttribute("filelist", filelist);
    	
    	return mav;
    }  
    
    
}