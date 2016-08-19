package com.wyp.mybatis.controller;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import sun.misc.BASE64Encoder;

import com.wyp.mybatis.inter.MeetingService;
import com.wyp.mybatis.inter.MessageService;
import com.wyp.mybatis.inter.UserService;
import com.wyp.mybatis.model.Meets;
import com.wyp.mybatis.model.Message;
import com.wyp.mybatis.model.User;
import com.wyp.mybatis.util.PageInfo;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/userCenter")
public class userCenterController extends SimpleFormController {
	@Autowired
	MeetingService MeetingService;
	@Autowired
    UserService userService;
	@Autowired
	MessageService messageService;
	
	//	查看信息并进入用户添加环节
	@RequestMapping("/checkInfo")
	public ModelAndView checkInfo(HttpServletRequest request,HttpServletResponse response){
		String mid = request.getParameter("meetId");	
        int meetId = 1;
        if(mid!=null &&!"".equals(mid)){
        	meetId = Integer.parseInt(mid);
        }
		//Meets meets = MeetingService.getMeetInfoById(meetId); 
		List<User> allUsers = MeetingService.getUsers();
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/checkMeets.jsp"));
		//mav.addObject("meets",meets);
		request.getSession().setAttribute("allUsers", allUsers);
		request.getSession().setAttribute("meetId", meetId);
		return mav;
	}

	
	//会议室申请成功后根据用户名获取会议列表分页显示
	@RequestMapping("/ownlist")
	public ModelAndView ownRoomList(HttpServletRequest request,HttpServletResponse response){
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int pageSize = 5;
		if (currentPage<=0){
			currentPage =1;
		}
		int currentResult = (currentPage-1) * pageSize;
		int userId = 1;
		
		PageInfo page = new PageInfo();
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);
		List<Meets> listmeet=MeetingService.getAllMeetsById(userId);
		
		int totalCount = page.getTotalResult();

		int lastPage=0;
		if (totalCount % pageSize==0){
			lastPage = totalCount / pageSize;
		}
		else{
			lastPage =1+ totalCount / pageSize;
		}
		
		if (currentPage>=lastPage){
			currentPage =lastPage;
		}
		String pageStr = "";
		pageStr=String.format("<a href=\"%s\">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"%s\">下一页</a>",
				request.getRequestURI()+"?page="+(currentPage-1),request.getRequestURI()+"?page="+(currentPage==lastPage?lastPage:currentPage+1) );

		
		ModelAndView mav = null;
		//获取参数，判断跳转页面
		String tz = request.getParameter("tz");
		if(tz!=""&&tz!=null){
			mav=new ModelAndView("redirect:/file/getUserFiles");
		}else{
			mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/user_myMeets.jsp"));
		}
		request.getSession().setAttribute("listmeet", listmeet);
		request.getSession().setAttribute("pageStr", pageStr);
		return mav;
	}
	
	//普通用户获取消息记录（与我相关界面）
		@RequestMapping("/getMessageAboutMe")
		public ModelAndView getMessageAboutMe(HttpServletRequest request,HttpServletResponse response){
			//首先从session中获取当前用户
			long userId = 10;
			//根据用户名获取消息并按id编号排序（倒序）
			List<Message> messlist = this.messageService.getMessageWithMe(userId);
			//分类，区分出用户未浏览的信息（分为已浏览和未浏览）
//			List<Message> list1 = new ArrayList<Message>();//用来存储未浏览的消息
//			List<Message> list2 = new ArrayList<Message>();//用来存储已浏览的消息
//			
//			for(Message message:messlist){
//				if(message.getIsScanF() == 0){
//					//用户未浏览
//					list1.add(message);
//				}else{
//					//用户已经浏览
//					list2.add(message);
//				}
//			}
			//重定向到用户中心消息界面
			ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/user_aboutMe.jsp"));
//			request.getSession().setAttribute("notScan", list1);
			request.getSession().setAttribute("messlist", messlist);
			return mav;
		}
		

	
	//在user_myInfo.jsp中使用
	@RequestMapping("/myInfo")
	public ModelAndView myInfo(HttpServletRequest request,HttpServletResponse response) throws NoSuchAlgorithmException, UnsupportedEncodingException{
	    int userId = 4;
		User user = userService.selectUserById(userId);
		//System.out.println(EncoderByMd5("941013"));
		//System.out.println(checkpassword("123456", EncoderByMd5("123456")));
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/user_myInfo.jsp"));
		//mav.addObject("meets",meets);
		request.getSession().setAttribute("user", user);
		return mav;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	//获取现在的日期
	public String getDate(){
		   Date currentTime = new Date();
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		   String dateString = formatter.format(currentTime);
		   return dateString;
		   
	}
	

	public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        //确定计算方法
        MessageDigest md5=MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
        return newstr;
    }
    
    
    /**判断用户密码是否正确
     * @param newpasswd  用户输入的密码
     * @param oldpasswd  数据库中存储的密码－－用户密码的摘要
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public boolean checkpassword(String newpasswd,String oldpasswd) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        if(EncoderByMd5(newpasswd).equals(oldpasswd))
            return true;
        else
            return false;
    }
	
}
