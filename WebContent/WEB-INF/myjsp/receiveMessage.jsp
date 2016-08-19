<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.wyp.mybatis.model.*,java.util.Set"%>      	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息</title>
<script src="../js/jquery-1.11.0.js"></script>
<link rel="stylesheet" type="text/css" href="../css/receiveMessage.css">
<script>
$(function(){
    $('#left').find('li').click(function(){
    	//返回会议信息
         $.ajax({
             type: "GET",
             url: "/OpenMeeting/message/getThingsByMeetId",
             data: {"meetId":$(this).val()},
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function(data){
						//alert(data);
                        $('#aaa').empty();   //清空resText里面的所有内容
                         var html = ''; 
                         $.each(data, function(i,item) {
                               html += '<div><font style="font-size:18px;font-weight:blod;line-height:30px;">'+"我又来做死了，这次的主题是童年"+'...</font>'+
                                 		'<br/><font style="color:#9F9696;">会议标题：</font><font style="color:blue;">'+item.meetTitle+'</font><font style="color:red;">　设置</font>'+
                                 		'<br/><font style="color:#9F9696;">时　　间：'+'2015年6月6日（星期六）晚上'+item.meetStartTime+'</font></div>';
                         });
                         		$('#aaa').html(html); 
 
                      },
             error: function (err) {
                 alert("返回的会议信息出错！！！");
             }

         });
         //返回用户消息
         $.ajax({
             type: "GET",
             url: "/OpenMeeting/message/getAllMessage",
             data: {"meetId":$(this).val()},
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function(data){
						//alert(data);
                        $('#cbg').empty();   //清空resText里面的所有内容
                         var html = ''; 
                         $.each(data, function(i,item) {
                               html += '<div class="ccc">'+
                   			'<div class="cccimg"><img src="../images/face1.jpg" /></div>'+
                   			'<div class="cccword">'+
                   				'<div class="fir"><font color="green">'+item.user.userName+'</font><font color="#C1BFBC">'+' '+'5月9日 21:33'+'</font></div>'+
                   				'<div class="sec">'+item.getInfo+'</div></div></div>';
                         });
                         		$('#cbg').html(html); 
 
                      },
             error: function (err) {
                 alert("654");
             }

         });

    });

});
</script>
</head>
<body>
<div style="width:100%;height:30px;"></div>
	<h1 style="text-align:center;line-height:100px;">　　　　　　　　Message</h1>
	<div id="left">
		<ul>
		<c:forEach  items='${listnotBe==null?listhaveBe:listnotBe}' var="item">
			<li value="${item.meetId}"><a href="javascript:">${item.meetTitle}</a></li>
		</c:forEach>	
		</ul>
	</div>
	<!-- 消息列表结束 -->
	<div id="right">
		<div id="aaa">
		<!-- 包括发信息的人、时间、会议标题，最新消息的时间 -->
		<font style="font-size:18px;font-weight:blod;line-height:30px;">我又来做死了，这次的标题是童年...</font>
		<br/><font style="color:#9F9696;">会议标题：</font><font style="color:blue;">新生动员</font><font style="color:red;">　设置</font>
		<br/><font style="color:#9F9696;">时　　间：2015年6月6日（星期六）晚上7：00</font>
		</div>
		<div id="bbb">
		<!-- 消息的内容 -->
			<div id="bbbb">　　据南方都市报消息，6月7日22时许，惠州铁路公安处接到江西省南昌市公安局东湖分局警情通报：
			涉嫌江西高考替考案疑犯赵某国（男，47岁，山东人）很可能乘坐深圳开往青岛的T398次列车潜逃，请求协助抓捕。
			接报后，惠铁警方立即部署乘警支队全力开展抓捕。据此前中新网报道，7日下午，江西九江警方抓获南昌替考事件犯罪嫌疑人彭某，据彭某交代，其头目赵某是全国高考舞弊案中的主要对象。</div>
		</div>
	<!-- 用户信息回复部分 -->
		<div id="cbg">
		<div class="ccc">
		<!-- 用户回复的消息内容，包括头像、用户名、时间、楼层、消息 -->
			<div class="cccimg"><img src="../images/face1.jpg" /></div>
			<div class="cccword">
				<div class="fir"><font color="green">虐煤矿莫</font><font color="#C1BFBC"> 5月9日 21:33</font></div>
				<div class="sec">会议由谁主持啊？ 可以请假不？</div>
			</div>
		</div>
		<div class="ccc">
		<!-- 用户回复的消息内容，包括头像、用户名、时间、楼层、消息 -->
			<div class="cccimg"><img src="../images/face1.jpg" /></div>
			<div class="cccword">
				<div class="fir"><font color="green">虐煤矿莫</font><font color="#C1BFBC"> 5月9日 21:33</font></div>
				<div class="sec">会议由谁主持啊？ 可以请假不？</div>
			</div>
		</div>
		<div class="ccc">
		<!-- 用户回复的消息内容，包括头像、用户名、时间、楼层、消息 -->
			<div class="cccimg"><img src="../images/face1.jpg" /></div>
			<div class="cccword">
				<div class="fir"><font color="green">虐煤矿莫</font><font color="#C1BFBC"> 5月9日 21:33</font></div>
				<div class="sec">会议由谁主持啊？ 可以请假不？</div>
			</div>
		</div>
		<div class="ccc">
		<!-- 用户回复的消息内容，包括头像、用户名、时间、楼层、消息 -->
			<div class="cccimg"><img src="../images/face1.jpg" /></div>
			<div class="cccword">
				<div class="fir"><font color="green">虐煤矿莫</font><font color="#C1BFBC"> 5月9日 21:33</font></div>
				<div class="sec">会议由谁主持啊？ 可以请假不？</div>
			</div>
		</div>
		<div class="ccc">
		<!-- 用户回复的消息内容，包括头像、用户名、时间、楼层、消息 -->
			<div class="cccimg"><img src="../images/face1.jpg" /></div>
			<div class="cccword">
				<div class="fir"><font color="green">虐煤矿莫</font><font color="#C1BFBC"> 5月9日 21:33</font></div>
				<div class="sec">会议由谁主持啊？ 可以请假不？</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
