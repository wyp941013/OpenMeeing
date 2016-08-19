<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="../js/jquery-1.11.0.js"></script>
<title>我的会议</title>
<script>
$(document).ready(function(){
	$("ul li:odd").css("background","#ccc");
    $("ul li:even").css("background","#fff");
	$("ul li:first").css("background","blue");
	$("ul li:first div").css("font-size","20px");
});
</script>
<style>
*{
margin:0;
padding:0;
}

ul{
list-style:none;
width:94%;
margin:0 auto;
}

li{
width:100%;
height:35px;
line-height:35px;
}

li div{
height:100%;
float:left;
font-size:14px;
font-family: "AvenirNextRoundedW01-Md",sans-serif;
font-weight: normal;
text-align:center; 
}
</style>
</head>
<body style="margin: 0; padding: 0;">
	<h1 style="text-align: center; line-height: 100px;">My Meetings</h1>
	<ul>
		<li>
			<div style="width:20%;">主题</div>
			<div style="width:11%;">组织人</div>
			<div style="width:13%;">日期</div>
			<div style="width:13%;">开始时间</div>
			<div style="width:13%;">结束时间</div>
			<div style="width:14%;">会议级别</div>
			<div style="width:16%;">操作</div>
		</li>
		<c:forEach  items="${listmeet}" var="item">
		<li>
			<div style="width:20%;">${item.meetTitle}</div>
			<div style="width:11%;">${item.meetManager}</div>
			<div style="width:13%;">${item.meetTime}</div>
			<div style="width:13%;">${item.meetStartTime}</div>
			<div style="width:13%;">${item.meetEndTime}</div>
			<div style="width:14%;">${item.meetPosition}</div>
			<div style="width:16%;"><a href="">查看</a></div>
		</li>
		</c:forEach>
	</ul>
		<div style="padding: 20px;text-align:center;">${pageStr}</div>
</body>
</html>
