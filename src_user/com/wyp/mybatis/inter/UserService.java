package com.wyp.mybatis.inter;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wyp.mybatis.model.User;
import com.wyp.mybatis.util.PageInfo;
public interface UserService {
	 //@Select("select * from user where id = #{id}")
	 //不使用映射文件，使用注解方式时在这儿写sql
	//使用映射文件时需要在User.xml的配置文件中，mapper namespace="com.yihaomen.mybatis.inter.IUserOperation" ，命名空间非常重要，不能有错
//	  public User selectUserByID(@Param(value="id") int id);
	  public List<User> selectUserByName(@Param("userName") String userName);
	  //方法名 selectUserByID 必须与 User.xml 里面配置的 select 的id 对应（<select id="selectUserByID"）
      
//	  在测试时报错：There is no getter for property named 'id' in 'class java.lang.String'
//	  问题分析：Mybatis默认采用ONGL解析参数，所以会自动采用对象树的形式取string.id值，引起报错。
//	  解决方法：  public Note findNoteByID(@Param(value="id") String id);说明参数值。
	  //依据用户Id获取用户信息
	  public User selectUserById(@Param("userId") int userId);
	  
	  @Select("select seqNum from users order by userId desc limit 1;")
	  public String getLastNum();
	  
	  //查询列表数据，即多条数据
	  public List<User> selectUsers(String userName); 
	  
	  //添加数据
	  public void addUser(User user);
	  
	  //用户-更新数据
	  public void updateUser(User user);
	  
	  //后台管理-更新数据
	  public void updateUserht(User user);
	  
	  //更新密码
	  public void updatePass(@Param("userId") long userId,@Param("password") String password);
	  
	  //删除数据信息
	  public void deleteUser(long id);
	  
	//分页信息	  
	  public List<User> selectUserssListPage(@Param("page") PageInfo page,@Param("userId") long userId);
	  
}
