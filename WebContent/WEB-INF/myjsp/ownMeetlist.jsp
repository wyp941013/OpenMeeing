<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
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
<script>
function selectAll() {
	var table = document.getElementById("fom");
	var tds = table.getElementsByTagName("td");
	//alert(tds.length);	
	for ( var i = 0; i < tds.length; i++) {
		if ( tds[i].childNodes[0].name == "delid") {
			 tds[i].childNodes[0].checked = true;
		}
	}
}

function unselectAll() {
	var table = document.getElementById("fom");
	var tds = table.getElementsByTagName("td");
	for ( var i = 0; i < tds.length; i++) {
		if (tds[i].childNodes[0].name == "delid") {
			if (tds[i].childNodes[0].checked == true)
				tds[i].childNodes[0].checked = false;
			/* else
				tds[i].childNodes[0].checked = true; */
		}
	}
}

function deletelink() {
	 
	var table = document.getElementById("fom");
	var tds = table.getElementsByTagName("td");
	var linklist = "";
	for ( var i = 0; i < tds.length; i++) {
		if (tds[i].childNodes[0].name == "delid") {
			if (tds[i].childNodes[0].checked == true) {
				linklist += tds[i].childNodes[0].id + ";";
			}
		}
	}
	if ("" == linklist) {
		alert("请选择需要删除的记录");
		return false;
	} else {
	 if(!confirm("确认要删除？")){
		return false;
		}  
		var str = "/OpenMeeting/meet/delete?linklist=" + linklist;
		window.location.href = str;
	}
	return true;
}
</script>
</head>
<body>
<div style="position:relative;top:100px;left:180px;">
	<span>
	选择：<a href="#" onclick="selectAll();">全选</a>-
	    <a href="#" onclick="unselectAll();">反选</a>
	</span>
	<input name="Submit" type="button" class="right-button08"
		value="删除所选会议信息" onclick="return deletelink();" />
</div>		
<div class="container div_table">
	<div class="table-responsive">
	<table border="1" class="table table-striped table-bordered" id="fom">
		<tr>
			<th>选择</th>
			<th style="width:130px;">会议主题</th>
			<th>会议主持</th>
			<th>会议日期</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>会议级别</th>
			<th>操作</th>
		</tr>
		<c:forEach  items="${listmeet}" var="item">
		<tr>
		    <td><input type="checkbox" id="${item.meetId}" name="delid" /></td>
			<td>${item.meetTitle} </td>
			<td>${item.meetManager} </td>
			<td>${item.meetTime}</td>
			<td>${item.meetStartTime}</td>
			<td>${item.meetEndTime}</td>
			<td>${item.meetPosition}</td>
			<%-- <c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>
			<c:choose>
				<c:when test="${nowDate-item.meetProTime.time < 86400000}">
			<td><a href="/OpenMeeting/meet/checkInfo?meetId=${item.meetId}">人选</a>&nbsp;|&nbsp;
			<a href="/OpenMeeting/meet/meetInfo?meetId=${item.meetId}">查看</a></td>
         		</c:when>
			    <c:otherwise> --%>
			<td><a href="/OpenMeeting/meet/meetInfo?meetId=${item.meetId}">查看</a></td>
			   <%--  </c:otherwise>
			    </c:choose> --%>
		</tr>
		</c:forEach>
	</table>
	<div style="padding:20px;">${pageStr}</div>
	</div>
</div>
</body>
</html>
