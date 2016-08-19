package com.wyp.mybatis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.wyp.mybatis.inter.MeetingService;
import com.wyp.mybatis.inter.MessageService;
import com.wyp.mybatis.model.Meets;
import com.wyp.mybatis.model.Message;



@Controller
@RequestMapping("/message")
public class MessageController{

	@Autowired
	MessageService messageService;
	@Autowired
	MeetingService meetService;


	//	会议通知信息发送
	@RequestMapping("/sendMessages")
	public ModelAndView sendMessages(String userlist,Message message,HttpServletRequest request,HttpServletResponse response){
		//创建一个Message对象
//		Message message = new Message();
		//获取信息sendInfo
//		String sendMessage = request.getParameter("sendMessage");
//		message.setSendInfo(sendMessage);
		//获取自身编号manager
		Integer applyUserId =   (Integer) request.getSession().getAttribute("userId");
		long ManagerId = 1;
		if(applyUserId>=1)
		{
			ManagerId = applyUserId;
		}
		message.setManager(ManagerId);
		//获取会议编号
		long meetId = 1;
		message.setMeetId(meetId);
		//获取当前系统时间
		Date proTime = new Date();
		message.setProTime(proTime);
		//指定目标List userId
		System.out.println("用户："+userlist);
		//消息发送开始
		long []arrayId = new long[100];
		if(userlist!=null && userlist!="")
		{
			String []arrayStr = userlist.split(";");
			for(int i=0;i<arrayStr.length;i++)
			{
				arrayId[i] = Long.parseLong(arrayStr[i]);
				message.setUserId(arrayId[i]);
				this.messageService.sendMessages(message);
			}
		}
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/ownlist");
		return mav;
	}
	
//	消息浏览字段更新
	@RequestMapping("/updateOne")
	public ModelAndView updateOne(Message message,HttpServletRequest request,HttpServletResponse response){
		//更新用户浏览字段，确认用户已浏览
		this.messageService.updateOne(message.getId());
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/ownlist");
		return mav;
	}
	
//	回复信息更新
	@RequestMapping("/updateTwo")
	public ModelAndView updateTwo(Message message,HttpServletRequest request,HttpServletResponse response){
		//系统时间
		message.setReturnTime(new Date());
		//更新回复信息
		this.messageService.updateTwo(message);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/userCenter/getMessageAboutMe");
		return mav;
	}
	
	
//	消息浏览字段更新
	@RequestMapping("/updateThird")
	public ModelAndView updateThird(Message message,HttpServletRequest request,HttpServletResponse response){
		//更新管理员浏览字段
		this.messageService.updateThird(message.getId());
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/meet/ownlist");
		return mav;
	}

    
	
//	获取所有会议消息
	@RequestMapping("/getAllMessage")
	public ModelAndView getAllMessage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String meetI = request.getParameter("meetId");
		long meetId = 1;
		if(meetI!=null&&!"".equals(meetI)){
			meetId = Long.parseLong(meetI);
		}
		//更新管理员浏览字段
		List<Message> listMessage = this.messageService.getAllMessage(meetId);
		System.out.println(listMessage);
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");  
        // 将数据对象转换成json数据  
        JSONArray json = JSONArray.fromObject(listMessage);  
        PrintWriter out = response.getWriter();  
        out.write(json.toString());  
        out.flush();  
        out.close();  
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("receiveMessage");
		return mav;
	}
	
	

	
//	获取所有会议消息
	@RequestMapping("/getThingsByMeetId")
	public ModelAndView getThingsByMeetId(Message message,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String meetI = request.getParameter("meetId");
		long meetId = 1;
		if(meetI!=null&&!"".equals(meetI)){
			meetId = Long.parseLong(meetI);
		}
		Meets meet = this.meetService.getMeetInfoById(meetId);
		System.out.println("会议信息："+meet);
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");  
          
        // 将数据对象转换成json数据  
        JSONArray json = JSONArray.fromObject(meet);  
        PrintWriter out = response.getWriter();  
        out.write(json.toString());  
        out.flush();  
        out.close();  
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("receiveMessage");
		return mav;
	}
	
		//新消息记录
		@RequestMapping("/newMeetings")
		public ModelAndView findnewMeetings(HttpServletRequest request,HttpServletResponse response){
		//1、先获得当前系统时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String date = df.format(new Date());//当前系统时间,2015-05-30 23:44:10
		//2、获得session中的用户	
			String applyUser = (String) request.getSession().getAttribute("username");
		//3、到数据库取出数据	
			List<Meets> listmeet= this.meetService.selectlistMeetsForCompare(applyUser);
	    //4、拆分当前系统时间，分别获得日期和时间,arrayStr[0]是日期，arrayStr[1]是时间
			String []arrayStr = date.split(" ");
			String []arrayday = arrayStr[0].split("-");//拆分日期，2015-05-30
		//5、创建对应list	
			List<Meets> listhaveBe= new ArrayList<Meets>();//已经开过的
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
							if(compareTime(arrayStr[1], startTime, endTime)>0){
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
			ModelAndView mav=new ModelAndView("receiveMessage");
			//mav.addObject("listhaveBe",listhaveBe);
			mav.addObject("listnotBe",listnotBe);
			mav.addObject("xp","1");
			return mav;
		}
		
		
		
		//新消息记录
		@RequestMapping("/oldMeetings")
		public ModelAndView findoldMeetings(HttpServletRequest request,HttpServletResponse response){
			//1、先获得当前系统时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String date = df.format(new Date());//当前系统时间,2015-05-30 23:44:10
			//2、获得session中的用户	
			String applyUser = (String) request.getSession().getAttribute("username");
			//3、到数据库取出数据	
			List<Meets> listmeet= this.meetService.selectlistMeetsForCompare(applyUser);
			//4、拆分当前系统时间，分别获得日期和时间,arrayStr[0]是日期，arrayStr[1]是时间
			String []arrayStr = date.split(" ");
			String []arrayday = arrayStr[0].split("-");//拆分日期，2015-05-30
			//5、创建对应list	
			List<Meets> listhaveBe= new ArrayList<Meets>();//已经开过的
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
							if(compareTime(arrayStr[1], startTime, endTime)>0){
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
			ModelAndView mav=new ModelAndView("receiveMessage");
			mav.addObject("listhaveBe",listhaveBe);
			mav.addObject("xp","2");
			//mav.addObject("listnotBe",listnotBe);
			return mav;
		}
		

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