package com.wyp.mybatis.inter;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wyp.mybatis.model.Message;

@Repository  
@Transactional  
public interface MessageService {
		//信息发送
		public void sendMessages(Message message);
		//更新isScanF单字段，确定用户已浏览
		public void updateOne(long id);
		//更新回复消息
		public void updateTwo(Message message);
		//更新isScan单字段
		public void updateThird(long id);
		//获取与用户相关的所有信息
		public List<Message> getMessageWithMe(long userId);
		//查找所有消息
		public List<Message> getAllMessage(long meetId);
}
