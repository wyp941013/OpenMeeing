package com.wyp.mybatis.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

import com.wyp.mybatis.inter.MeetUserService;
import com.wyp.mybatis.inter.MeetingService;
import com.wyp.mybatis.model.Meets;
import com.wyp.mybatis.model.User;
import com.wyp.mybatis.model.meetUser;
import com.wyp.mybatis.util.PageInfo;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/meet")
public class MeetController extends SimpleFormController {
	@Autowired
	MeetingService MeetingService;
	@Autowired
	MeetUserService meetUserService;
	
	//	会议添加
	@RequestMapping("/insert")
	public ModelAndView insertMeets(Meets meets,HttpServletRequest request,HttpServletResponse response){
//        Timestamp meetProTime = new Timestamp(new Date().getTime());
		Date meetProTime = new Date();
		meets.setMeetProTime(meetProTime);
		String applyUser = (String) request.getSession().getAttribute("username");
		meets.setApplyUser(applyUser);
//		System.out.println(meets.getMeetStartTime()+"555555555555555555555"+meets.getMeetEndTime());
		MeetingService.addMeets(meets); 
//		System.out.println(meets);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/ownlist");
		return mav;
	}
	
	
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
	
	
	//	查看会议信息包括刚选择的会议用户及信息的发送
	@RequestMapping("/meetInfo")
	public ModelAndView meetInfo(HttpServletRequest request,HttpServletResponse response){
		long meetId = 31;//默认会议编号
		String meetii = request.getParameter("meetId");//get接收可能从查看直接传过来的值
		if(meetii!=null && !"".equals(meetii)){
			meetId = Long.parseLong(meetii);
		}else{
			long meetI = (Long) request.getSession().getAttribute("meetId");//接收跳转过来的参数	
			meetId = meetI;
		}
		//首先获取到这次的会议信息
		Meets meets = MeetingService.getMeetInfoById(meetId); 
		//其次，获取到会议相关用户信息
		List<meetUser> allUsers = meetUserService.getUsersBymeetId(meetId);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("meetInfo");
		//mav.addObject("meets",meets);
		request.getSession().setAttribute("allUsers", allUsers);
		request.getSession().setAttribute("meets", meets);
		return mav;
	}

	
	//	信息更新
	@RequestMapping("/goupdate")
	public ModelAndView goUpdateMeets(HttpServletRequest request,HttpServletResponse response){
        String mid = request.getParameter("meetid");	
        int meetId = 1;
        if(mid!=null &&!"".equals(mid)){
        	meetId = Integer.parseInt(mid);
        }
		Meets meets = MeetingService.getMeetInfoById(meetId); 
//		System.out.println(meets+"5555555555555555555555555");
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/updatemeet.jsp"));
		mav.addObject("meets",meets);
		return mav;
	}
	
	
	//	信息更新
	@RequestMapping("/update")
	public ModelAndView updateMeets(Meets meets,HttpServletRequest request,HttpServletResponse response){
		Date meetProTime = new Date();
		meets.setMeetProTime(meetProTime);//
		
//		SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss");
//		String s=sdf.format(meets.getMeetTime());
//		try {
//			Time time =  (Time) sdf.parse(s) ;
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
		
		meets.setMeetTime(this.getDate());//开会日期
		
		MeetingService.updateMeets(meets); 
		System.out.println(meets);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/ownlist");
		return mav;
	}
	
	//信息删除
	@RequestMapping("/delete")
	public ModelAndView deleteMeets(HttpServletRequest request,HttpServletResponse response){
		String linklist = request.getParameter("linklist");
		System.out.println("删除："+linklist);
		long []arrayId = new long[100];
		if(linklist!=null && linklist!="")
		{
			String []arrayStr = linklist.split(";");
			for(int i=0;i<arrayStr.length;i++)
			{
				arrayId[i] = Long.parseLong(arrayStr[i]);	
				this.MeetingService.deleteMeets(arrayId[i]);
			}
		}
		
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/ownlist");
		return mav;
	}
	
	//	删除指定会议的指定用户
	@RequestMapping("/deleteUser")
	public ModelAndView deleteMeetUser(HttpServletRequest request,HttpServletResponse response){
		String userId = request.getParameter("userId");
		String meetId = request.getParameter("meetId");
		
		//删除指定用户记录
		this.meetUserService.deleteUser(Long.parseLong(meetId), Long.parseLong(userId));
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/meetInfo");
		request.getSession().setAttribute("meetId", Long.parseLong(meetId));
		return mav;
	}
	
//按类型搜索各种类型会议的数量
	@RequestMapping("/findMeetsNumByType")
	public ModelAndView findMeetsNumByType(HttpServletRequest request,HttpServletResponse response){
		String applyUser = (String) request.getSession().getAttribute("username");
		List<Meets> listxsdy= this.MeetingService.findMeetsByType(applyUser,"新生动员");
		List<Meets> listjstl= this.MeetingService.findMeetsByType(applyUser,"技术讨论");
		List<Meets> listbmlh= this.MeetingService.findMeetsByType(applyUser,"部门例会");
		//重定向到分页显示列表
		System.out.println(applyUser);
		System.out.println(listxsdy);
		ModelAndView mav=new ModelAndView("meetlistByType");
		mav.addObject("listxsdy",listxsdy);
		mav.addObject("listjstl",listjstl);
		mav.addObject("listbmlh",listbmlh);
		return mav;
	}
	
	
//按类型搜索各种类型会议的数量
	@RequestMapping("/findMeetsNumByTime")
	public ModelAndView findMeetsNumByTime(HttpServletRequest request,HttpServletResponse response){
	//1、先获得当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println("当前系统时间："+df.format(new Date()));// new Date()为获取当前系统时间
		String date = df.format(new Date());//当前系统时间,2015-05-30 23:44:10
	//2、获得session中的用户	
		String applyUser = (String) request.getSession().getAttribute("username");
	//3、到数据库取出数据	
		List<Meets> listmeet= this.MeetingService.selectlistMeetsForCompare(applyUser);
    //4、拆分当前系统时间，分别获得日期和时间,arrayStr[0]是日期，arrayStr[1]是时间
		String []arrayStr = date.split(" ");
		String []arrayday = arrayStr[0].split("-");//拆分日期，2015-05-30
	//5、创建对应list	
		List<Meets> listhaveBe= new ArrayList<Meets>();//已经开过的
		List<Meets> listisBe= new ArrayList<Meets>();//正在开的
		List<Meets> listnotBe= new ArrayList<Meets>();//还没有开的
	//6、循环并根据比对时间的结果划分为三部分
		for(Meets meet:listmeet){
			String day = meet.getMeetTime();//会议日期,2015-05-13
			String startTime = meet.getMeetStartTime();//会议开始时间,10:00:00
			String endTime = meet.getMeetEndTime();//会议结束时间
			String []arrayStr1 = day.split("-");
			//1.比较年份
			if(compareDay(arrayday[0],arrayStr1[0])>0){
				//当前年份比会议年份大,该会议已开过
				listhaveBe.add(meet);
				continue;
			}else if(compareDay(arrayday[0],arrayStr1[0])==0){
				//当前年份与会议年份一样
				
				//2.比较月份
				if(compareDay(arrayday[1],arrayStr1[1])>0){
					//当前月份比会议月份大,该会议已开过
					listhaveBe.add(meet);
					continue;
				}else if(compareDay(arrayday[1],arrayStr1[1])==0){
					//当前月份与会议月份一样
					
					//3.比较日
					if(compareDay(arrayday[2],arrayStr1[2])>0){
						//当前日子比会议日子大,该会议已开过
						listhaveBe.add(meet);
						continue;
					}else if(compareDay(arrayday[2],arrayStr1[2])==0){
						//当前日子与会议日子一样
						
						if(compareTime(arrayStr[1], startTime, endTime)==0){
							listisBe.add(meet);
							continue;
						}else if(compareTime(arrayStr[1], startTime, endTime)>0){
							listhaveBe.add(meet);
							continue;
						}else{
							listnotBe.add(meet);
							continue;
						}
						
					}else{
						//当前月份比会议月份小
						listnotBe.add(meet);
						continue;
					}
					
				}else{
					//当前月份比会议月份小
					listnotBe.add(meet);
					continue;
				}
				
			}else{
				//当前年份比会议年份小
				listnotBe.add(meet);
				continue;
			}
			
		}
		//重定向到分页显示列表
		System.out.println(applyUser);
		ModelAndView mav=new ModelAndView("meetlistByTime");
		mav.addObject("listhaveBe",listhaveBe);
		mav.addObject("listisBe",listisBe);
		mav.addObject("listnotBe",listnotBe);
		return mav;
	}
	
	
//	参会人员选择，并添加到meetuser表中
	@RequestMapping("/addmeetuser")
	public ModelAndView addMeetUsers(HttpServletRequest request,HttpServletResponse response){
		String linklist = request.getParameter("userlink");
		System.out.println("用户列表："+linklist);
		String meetId1 = request.getParameter("meetId");
		long meetId = 1;
        if(meetId1!=null &&!"".equals(meetId1)){
        	meetId = Long.parseLong(meetId1);
        }
		long []arrayId = new long[100];
		if(linklist!=null && linklist!="")
		{
			String []arrayStr = linklist.split(";");
			for(int i=0;i<arrayStr.length;i++)
			{
				arrayId[i] = Long.parseLong(arrayStr[i]);	
				System.out.println("用户id:"+arrayId[i]);
				this.MeetingService.addmeetUsers(arrayId[i],meetId);
			}
		}
		
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/meetInfo");
		request.getSession().setAttribute("meetId", meetId);
		return mav;
	}
	
	
	@RequestMapping("/jumpOther")
	public ModelAndView jumpOther(HttpServletRequest request,HttpServletResponse response){
        String meetTime = request.getParameter("meetTime");
        String meetStartTime = request.getParameter("meetStartTime");
        String meetEndTime = request.getParameter("meetEndTime");
        System.out.println(meetStartTime+"  "+meetEndTime);
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/insertmeet.jsp"));
//		mav.addObject("meetStartTime",meetStartTime);
//		mav.addObject("meetEndTime",meetEndTime);
		mav.addObject("meetTime",meetTime);
		request.getSession().setAttribute("meetStartTime", meetStartTime);
		request.getSession().setAttribute("meetEndTime", meetEndTime);
		return mav;
	}
	

	@RequestMapping("/timeline")
	public ModelAndView search(HttpServletRequest request,HttpServletResponse response){
		String roomId = request.getParameter("roomId");
		long mId =1;
		if(roomId!=null&&!"".equals(roomId)){
			mId = Long.parseLong(roomId);
		}
		String ttt = request.getParameter("meetTime");
		System.out.println("接收到的时间："+ttt);
        System.out.println("房间ID："+mId+" 时间："+getDate());
        //1.从数据库获取今天这个使用房间的所有会议信息
		List<Meets> listmeets= new ArrayList<Meets>();
		listmeets =	MeetingService.selectMeetInfos(mId,ttt); 
		//2.将信息按时间顺序排序
		Collections.sort(listmeets,comparator);
		//3.将信息发送出去
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/timeline.jsp"));
		
		//因为上面的跳转使用的是重定向，所以需要使用session来传送数据
		request.getSession().setAttribute("listmeets", listmeets);
		request.getSession().setAttribute("meetTime", ttt);
        return mav;
		
		
//		for (Meets meets : listmeets) {
//			System.out.println("返回列表："+meets.getMeetStartTime());
//		}
	}
	
//	分页显示
	@RequestMapping("/pagelist")
	public ModelAndView pageList(HttpServletRequest request,HttpServletResponse response){
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int pageSize = 6;
		if (currentPage<=0){
			currentPage =1;
		}
		int currentResult = (currentPage-1) * pageSize;
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getQueryString());
		String applyUser = (String) request.getSession().getAttribute("username");
		
		PageInfo page = new PageInfo();
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);
		List<Meets> listmeet=MeetingService.selectListPageMeets(page,applyUser);
		System.out.println(page);
		
		int totalCount = page.getTotalResult();
		System.out.println("总条数为："+totalCount);
		int lastPage=0;
		if (totalCount % pageSize==0){
			lastPage = totalCount / pageSize;
		}
		else{
			lastPage = totalCount / pageSize+1;
		}
		
		if (currentPage>=lastPage){
			currentPage =lastPage;
		}
		
		String pageStr = "";

		pageStr=String.format("<a href=\"%s\">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"%s\">下一页</a>",
						request.getRequestURI()+"?page="+(currentPage-1),request.getRequestURI()+"?page="+(currentPage==lastPage?lastPage:currentPage+1) );


		//锟狡讹拷锟斤拷图锟斤拷也锟斤拷锟斤拷list.jsp
		ModelAndView mav=new ModelAndView("meetlist");
		mav.addObject("listmeet",listmeet);
		mav.addObject("pageStr",pageStr);
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
		String applyUser = "wang";
		
		PageInfo page = new PageInfo();
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);
		List<Meets> listmeet=MeetingService.selectListPageMeetsByApplyUser(page,applyUser);
		
		System.out.println(page);
		int totalCount = page.getTotalResult();

		int lastPage=0;
		if (totalCount % pageSize==0){
			lastPage = totalCount / pageSize;
		}
		else{
			lastPage =totalCount / pageSize+1;
		}
		
		if (currentPage>=lastPage){
			currentPage =lastPage;
		}
		
		String pageStr = "";

		pageStr=String.format("<a href=\"%s\">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"%s\">下一页</a>",
				request.getRequestURI()+"?page="+(currentPage-1),request.getRequestURI()+"?page="+(currentPage==lastPage?lastPage:currentPage+1) );


		//锟狡讹拷锟斤拷图锟斤拷也锟斤拷锟斤拷list.jsp
		ModelAndView mav=new ModelAndView("ownMeetlist");
		mav.addObject("listmeet",listmeet);
		mav.addObject("pageStr",pageStr);
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
	
	//根据类的个别属性对list进行排序
	Comparator<Meets> comparator = new Comparator<Meets>(){
		   public int compare(Meets s1, Meets s2) {
		    //先排年龄
		    if(!s1.getMeetStartTime().equals(s2.getMeetStartTime())){
		     return s1.getMeetStartTime().compareTo(s2.getMeetStartTime());
		    }else{
		    	return (int) (s1.getMeetId() - s2.getMeetId());
		    }
		    
		   }
	};

	public int compareDay(String str1,String str2){
	   int num1 = Integer.parseInt(str1);
	   int num2 = Integer.parseInt(str2);
		if(num1==num2){
	    	//相等
	    	return 0;
	    }else{
	    	if(num1<num2){
	    		return -1;
	    	}else{
	    		return 1;
	    	}
	    }
	}
	
	public int compareTime(String now,String start,String end){
		String []arrayStr1 = now.split(":");
		String []arrayStr2 = start.split(":");
		String []arrayStr3 = end.split(":");
		long num1 = Integer.parseInt(arrayStr1[0])*3600+Integer.parseInt(arrayStr1[1])*60+Integer.parseInt(arrayStr1[2]);
		long num2 = Integer.parseInt(arrayStr2[0])*3600+Integer.parseInt(arrayStr2[1])*60+Integer.parseInt(arrayStr2[2]);
		long num3 = Integer.parseInt(arrayStr3[0])*3600+Integer.parseInt(arrayStr3[1])*60+Integer.parseInt(arrayStr3[2]);
		if(num1>=num2&&num1<=num3){
			return 0;
		}else if(num1<num2){
			return -1;
		}else {
			return 1;
		}
	}
	
}
