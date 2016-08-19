package com.wyp.mybatis.controller;


import java.text.SimpleDateFormat;
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

import com.wyp.mybatis.inter.RoomsService;
import com.wyp.mybatis.model.Rooms;
import com.wyp.mybatis.util.PageInfo;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/room")
public class RoomController extends SimpleFormController {
	@Autowired
	RoomsService RoomsService;

	//	会议添加
	@RequestMapping("/insert")
	public ModelAndView insertRooms(Rooms rooms,HttpServletRequest request,HttpServletResponse response){
		
		RoomsService.addRooms(rooms); 
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/room/pagelist");
		return mav;
	}
	
	//	信息更新
	@RequestMapping("/goupdate")
	public ModelAndView goUpdateRooms(HttpServletRequest request,HttpServletResponse response){
        String mid = request.getParameter("roomId");	
        long RoomId = 1;
        if(mid!=null &&!"".equals(mid)){
        	RoomId = Long.parseLong(mid);
        }
		Rooms Rooms = RoomsService.getRoomsInfo(RoomId); 
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/updateRoom.jsp"));
		mav.addObject("Rooms",Rooms);
		return mav;
	}
	
	
	//	信息更新
	@RequestMapping("/checkRooms")
	public ModelAndView checkRooms(HttpServletRequest request,HttpServletResponse response){
		String mid = request.getParameter("roomId");	
		long RoomId = 1;
		if(mid!=null &&!"".equals(mid)){
			RoomId = Long.parseLong(mid);
		}
		Rooms Rooms = RoomsService.getRoomsInfo(RoomId); 
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView(new RedirectView("/OpenMeeting/htjsp/updateRoom.jsp"));
		mav.addObject("Rooms",Rooms);
		return mav;
	}
	
	
	//	信息更新
	@RequestMapping("/update")
	public ModelAndView updateRooms(Rooms Rooms,HttpServletRequest request,HttpServletResponse response){
		
		RoomsService.updateRooms(Rooms); 
//		System.out.println(Rooms);
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/room/pagelist");
		return mav;
	}
	
	//	信息更新
	@RequestMapping("/delete")
	public ModelAndView deleteRooms(HttpServletRequest request,HttpServletResponse response){
		String linklist = request.getParameter("linklist");
		System.out.println("删除："+linklist);
		long []arrayId = new long[100];
		if(linklist!=null && linklist!="")
		{
			String []arrayStr = linklist.split(";");
			for(int i=0;i<arrayStr.length;i++)
			{
				arrayId[i] = Long.parseLong(arrayStr[i]);	
				this.RoomsService.deleteRooms(arrayId[i]);
			}
		}
		
		//重定向到分页显示列表
		ModelAndView mav=new ModelAndView("redirect:/room/pagelist");
		return mav;
	}
	

	//	分页显示
	@RequestMapping("/pagelist")
	public ModelAndView pageList(HttpServletRequest request,HttpServletResponse response){
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int pageSize = 5;
		if (currentPage<=0){
			currentPage =1;
		}
		int currentResult = (currentPage-1) * pageSize;
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getQueryString());
		
		PageInfo page = new PageInfo();
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);
		List<Rooms> listRoom=RoomsService.selectRoomsListPage(page,1);
		
		System.out.println(page);
		
		int totalCount = page.getTotalResult();
		System.out.println("总条数为："+totalCount);
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
		ModelAndView mav=new ModelAndView("roomlist");
		mav.addObject("listRoom",listRoom);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	//	分页显示
	@RequestMapping("/newpagelist")
	public ModelAndView newpageList(HttpServletRequest request,HttpServletResponse response){
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int pageSize = 5;
		if (currentPage<=0){
			currentPage =1;
		}
		int currentResult = (currentPage-1) * pageSize;
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getQueryString());
		
		PageInfo page = new PageInfo();
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);
		List<Rooms> listRoom=RoomsService.selectRoomsListPage(page,1);
		
		System.out.println(page);
		
		int totalCount = page.getTotalResult();
		System.out.println("总条数为："+totalCount);
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
		ModelAndView mav=new ModelAndView("roomlist1");
		mav.addObject("listRoom",listRoom);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
