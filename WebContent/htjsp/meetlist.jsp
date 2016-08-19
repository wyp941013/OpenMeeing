<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.wyp.mybatis.model.*,java.util.Set"%>      	
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
<title>会议列表</title>
</head>
<body>
	
<div class="container div_table">
	<div class="table-responsive">
	<table border="1" class="table table-striped table-bordered">
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
		<c:forEach  items="${listmeet}" var="item">
		<tr>
        <c:set var="mm" scope="page" value="${item.room}"></c:set>
            <td>${item.meetTitle}</td>
            <td>${item.meetManager}</td>
            <td>${item.meetTime}</td>
			<td><%=((Rooms)((Set<Rooms>)pageContext.getAttribute("mm")).toArray()[0]).getRoomNumber()%></td>
			<td>${item.meetStartTime}</td>
			<td>${item.meetEndTime}</td>
			<td>${item.meetPosition}</td>
			<td><a href='/OpenMeeting/meet/meetInfo?meetId=${item.meetId}'>查看</a></td>
		</tr>
		</c:forEach>
	</table>
	<div style="padding:20px;">${pageStr}</div>
	</div>
</div>
</body>
</html>
