package com.wyp.mybatis.inter;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.wyp.mybatis.model.Rooms;
import com.wyp.mybatis.util.PageInfo;

public interface RoomsService {

	  //添加数据
	  public void addRooms(Rooms rooms);
	  
	  //更新数据
	  public void updateRooms(Rooms room);
	  
	  //删除数据信息
	  public void deleteRooms(long roomId);
	  
	  //查看某一条信息
	  public Rooms getRoomsInfo(long roomId);
	  
      //分页信息	  
	  public List<Rooms> selectRoomsListPage(@Param("page") PageInfo page,@Param("roomId") long roomId);
}
