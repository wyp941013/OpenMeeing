package com.wyp.mybatis.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wyp.mybatis.model.meetUser;

@Repository  
@Transactional  
public interface MeetUserService {
		//删除指定会议中的指定用户
		public void deleteUser(@Param("meet_id")long meet_id,@Param("user_id")long user_id);
		//查找所有消息
		public List<meetUser> getUsersBymeetId(long meetId);
}
