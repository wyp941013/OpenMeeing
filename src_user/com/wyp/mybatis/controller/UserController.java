package com.wyp.mybatis.controller;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sun.misc.BASE64Encoder;

import com.wyp.mybatis.inter.UserService;
import com.wyp.mybatis.model.User;
import com.wyp.mybatis.util.PageInfo;
import com.wyp.util.MD5;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	
//	用户登录
	@RequestMapping("/managerlogin")
	public ModelAndView managerlogin(HttpServletRequest request,HttpServletResponse response) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		//System.out.println(userName+"  "+password);
		List<User> users = userService.selectUserByName(userName);
		//System.out.println(users.size());
		ModelAndView mav = null;
		for(User user:users){
			if(checkpassword(password,user.getPassword())){
				//用户密码正确
				if(user.getPermission()!=2){
					//Session设置
					request.getSession().setAttribute("username", user.getUserName());
					request.getSession().setAttribute("userId", user.getUserId());
					//权限足够
					mav=new ModelAndView("managing");
					break;
				}else{
				//账号权限不足
				mav=new ModelAndView(new RedirectView("/OpenMeeting/index.jsp"));
				break;
				}
			}else{
				//密码错误
				mav=new ModelAndView(new RedirectView("/OpenMeeting/login.jsp"));
				}
		}
		
		if(users.size()==0){
			mav=new ModelAndView(new RedirectView("/OpenMeeting/index.jsp"));
		}
		//重定向到分页显示列表
		return mav;
	}
	
	
	
//	用户注销
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();		
		if(session != null){			
			session.removeAttribute("username");
		}
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/index.jsp"));
		return mav;
	}
//	会议添加
	@RequestMapping("/insert")
	public ModelAndView insertMeets(User user,HttpServletRequest request,HttpServletResponse response) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		//初始密码都设为123456
		user.setPassword(EncoderByMd5("123456"));
		//获取表中最后一条账号
		String sn = userService.getLastNum();
		//添加账号
		user.setSeqNum(increaNum(sn));

		userService.addUser(user); 
		
		System.out.println(user);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/user/pagelist");
		return mav;
	}
	
	//	查看信息并进入用户添加环节
	@RequestMapping("/checkInfo")
	public ModelAndView checkInfo(HttpServletRequest request,HttpServletResponse response){
		String mid = request.getParameter("userId");	
        int userId = 1;
        if(mid!=null &&!"".equals(mid)){
        	userId = Integer.parseInt(mid);
        }
		//Meets meets = MeetingService.getMeetInfoById(meetId); 
		User user1 = userService.selectUserById(userId);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/checkMeets.jsp"));
		//mav.addObject("meets",meets);
		request.getSession().setAttribute("user1", user1);
		return mav;
	}

	
	//	信息更新
	@RequestMapping("/goupdate")
	public ModelAndView goUpdateMeets(HttpServletRequest request,HttpServletResponse response){
        String mid = request.getParameter("userId");	
        int userId = 1;
        if(mid!=null &&!"".equals(mid)){
        	userId = Integer.parseInt(mid);
        }
		User user2 = userService.selectUserById(userId); 
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/updatemeet.jsp"));
		mav.addObject("user2",user2);
		return mav;
	}
	
	
	//	后台管理-信息更新
	@RequestMapping("/update")
	public ModelAndView updateUser(User user,HttpServletRequest request,HttpServletResponse response){
		userService.updateUserht(user); 
		System.out.println(user);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/user/pagelist");
		return mav;
	}
	
	//	前台用户-信息更新
	@RequestMapping("/updateown")
	public ModelAndView updateUseronly(User user,HttpServletRequest request,HttpServletResponse response){
		userService.updateUser(user); 
		System.out.println(user);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/userCenter/myInfo");
		return mav;
	}
	
	//	前台用户-密码更改
	@RequestMapping("/updatePass")
	public ModelAndView updatePass(HttpServletRequest request,HttpServletResponse response) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		String pass = request.getParameter("password");
		long userId = 4;
		this.userService.updatePass(userId,EncoderByMd5(pass)); 
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/userCenter/myInfo");
		return mav;
	}
	
	//	信息更新
	@RequestMapping("/delete")
	public ModelAndView deleteUsers(HttpServletRequest request,HttpServletResponse response){
		String linklist = request.getParameter("linklist");
		System.out.println("删除："+linklist);
		long []arrayId = new long[100];
		if(linklist!=null && linklist!="")
		{
			String []arrayStr = linklist.split(";");
			for(int i=0;i<arrayStr.length;i++)
			{
				arrayId[i] = Long.parseLong(arrayStr[i]);	
				this.userService.deleteUser(arrayId[i]);
			}
		}
		
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/user/pagelist");
		return mav;
	}
	
//	分页显示
	@RequestMapping("/pagelist")
	public ModelAndView pageList(HttpServletRequest request,HttpServletResponse response){
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int pageSize = 8;
		if (currentPage<=0){
			currentPage =1;
		}
		int currentResult = (currentPage-1) * pageSize;
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getQueryString());
		PageInfo page = new PageInfo();
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);
		List<User> listuser=this.userService.selectUserssListPage(page,1);
		
		System.out.println(page);
		
		int totalCount = page.getTotalResult();
		System.out.println("总条数为："+totalCount);
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


		//锟狡讹拷锟斤拷图锟斤拷也锟斤拷锟斤拷list.jsp
		ModelAndView mav=new ModelAndView("userlist");
		mav.addObject("listuser",listuser);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	public String increaNum(String sn){
		long num = Long.parseLong(sn);
		num++;
		String n = num+"";
		return n;
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
	
	public static void main(String[] args) {
		
	}
	
}
