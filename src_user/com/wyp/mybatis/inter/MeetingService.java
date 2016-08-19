package com.wyp.mybatis.inter;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wyp.mybatis.model.Meets;
import com.wyp.mybatis.model.User;
import com.wyp.mybatis.util.PageInfo;

public interface MeetingService {
	  
	  //根据名字查询列表数据，返回多条数据
	  public List<Meets> selectMeetsByName(String meetTitle); 
	  
	  //根据名字查询列表数据，返回多条数据
	  public List<Meets> selectMeetInfos(@Param("room_id") long roomId,@Param("meetTime") String meetTime); 
	  
	  //添加数据
	  public void addMeets(Meets meets);
	  
	  //添加会议参会用户
	  public void addmeetUsers(@Param("user_id")long user_id,@Param("meet_id")long meet_id);
	  
	  //根据id获取会议信息
	  public Meets getMeetInfoById(long meetId);
	  
	  //根据id获取会议信息
	  public List<User> getUsers();
	  
	  //更新数据
	  public void updateMeets(Meets meets);
	  
	  //删除数据信息
	  public void deleteMeets(long id);
	  
	  //获取分页信息
	  public List<Meets> selectListPageMeets(@Param("page") PageInfo page,@Param("applyUser") String applyUser);

	  //根据分页信息及会议申请人获取分页信息
	  public List<Meets> selectlistMeetsForCompare(@Param("applyUser") String applyUser);
	
	  //根据分页信息及会议申请人获取分页信息
	  public List<Meets> selectListPageMeetsByApplyUser(@Param("page") PageInfo page,@Param("applyUser") String applyUser);
       
	  //根据分页信息及会议申请人获取分页信息
	  public List<Meets> findMeetsByType(@Param("applyUser") String applyUser,@Param("meetType") String meetType);
	  
	  //根据登录的用户id在meetuser表中查找所有相关的会议，并显示会议信息
	  public List<Meets> getAllMeetsById(@Param("userId")int userId);
}
