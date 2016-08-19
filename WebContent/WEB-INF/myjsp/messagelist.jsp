<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.text.*"%>
	<%@ page import="java.util.*"%>
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
<body style="margin: 0; padding: 0;">
<div class="container div_table">

<div class="table-responsive">
	<table border="1" class="table table-striped table-bordered">
		<tr>
			<th>房间号</th>
			<th>开放时间</th>
			<th>关闭时间</th>
			<th>是否开放</th>
			<th>管理员</th>
			<th>操作</th>
		</tr>
		<c:forEach  items="${listRoom}" var="item">
		<tr>
		    
			<td>${item.roomNumber} </td>
			<td>${item.openTime}</td>
			<td>${item.closeTime}</td>
			<td>
			<c:choose>
         		<c:when test="${item.isOpen==0}">
         		开放	
         		</c:when>
			    <c:otherwise>
			          关闭
			    </c:otherwise>
			    </c:choose>
			</td>
			<td>${item.roomManager}</td>
			<td><a href="/OpenMeeting/room/checkRooms?roomId=${item.roomId}">查看</a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
		<div style="padding: 20px;">${pageStr}</div>
</div>
</body>
</html>
