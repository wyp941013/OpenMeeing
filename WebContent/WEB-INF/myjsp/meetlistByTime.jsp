<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 包含 bootstrap 样式表 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/pagelist.css">
<script src="../js/jquery-1.11.0.js"></script>
<script src="../js/MyJs_6.js"></script>
<title>会议列表</title>

<style>
*{
margin:0;
padding:0;
}

.switch_tag{
float:left;
width:520px;
position:relative;
top:80px;
left:380px;
}

.switch_tag ul{
list-style:none;
width:100%;
}

.switch_tag ul li{
height:50px;
line-height:50px;
width:32%;
float:left;
text-align:center;
}

table{
width:700px;
display:none;
}

th,td{
width:12.5%;
}

.tabs{
cursor:pointer;
}
</style>
</head>
<body>
<div class="switch_tag">
<ul id="tabList">
<li id="xsdy_tabs" class="tabs" onclick="TabSwitch('zyjy','xsdy_tabs')">已完成</li>
<li id="jstl_tabs" class="tabs" onclick="TabSwitch('jstl','jstl_tabs')">进行中</li>
<li id="bmlh_tabs" class="tabs" onclick="TabSwitch('bmlh','bmlh_tabs')">未完成</li>
</ul>
</div>	
<div class="container div_table" style="float:left;position:relative;left:-270px;">
	<div class="table-responsive" id="newsLists">
	<table border="1" class="table table-striped table-bordered" id="zyjy" style="display:block">
		<tr>
			<th>会议主题</th>
			<th>会议主持</th>
			<th>会议日期</th>
			<th>会议地点</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>会议级别</th>
			<th>操作</th>
		</tr>
		<c:forEach  items="${listhaveBe}" var="item">
		<tr>
			<td>${item.meetTitle} </td>
			<td>${item.meetManager} </td>
			<td>${item.meetTime}</td>
			<td>${item.room_id}</td>
			<td>${item.meetStartTime}</td>
			<td>${item.meetEndTime}</td>
			<td>${item.meetPosition}</td>
			<td><a href="/OpenMeeting/meet/meetInfo?meetId=${item.meetId}">查看</a></td>
		</tr>
		</c:forEach>
	</table>
	<table border="1" class="table table-striped table-bordered" id="jstl">
		<tr>
			<th>会议主题</th>
			<th>会议主持</th>
			<th>会议日期</th>
			<th>会议地点</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>会议级别</th>
			<th>操作</th>
		</tr>
		<c:forEach  items="${listisBe}" var="item">
		<tr>
			<td>${item.meetTitle} </td>
			<td>${item.meetManager} </td>
			<td>${item.meetTime}</td>
			<td>${item.room_id}</td>
			<td>${item.meetStartTime}</td>
			<td>${item.meetEndTime}</td>
			<td>${item.meetPosition}</td>
			<td><a href="/OpenMeeting/meet/meetInfo?meetId=${item.meetId}">查看</a></td>
		</tr>
		</c:forEach>
	</table>
	<table border="1" class="table table-striped table-bordered" id="bmlh">
		<tr>
			<th>会议主题</th>
			<th>会议主持</th>
			<th>会议日期</th>
			<th>会议地点</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>会议级别</th>
			<th>操作</th>
		</tr>
		<c:forEach  items="${listnotBe}" var="item">
		<tr>
			<td>${item.meetTitle} </td>
			<td>${item.meetManager} </td>
			<td>${item.meetTime}</td>
			<td>${item.room_id}</td>
			<td>${item.meetStartTime}</td>
			<td>${item.meetEndTime}</td>
			<td>${item.meetPosition}</td>
			<td><a href="/OpenMeeting/meet/meetInfo?meetId=${item.meetId}">查看</a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</div>
</body>
</html>
