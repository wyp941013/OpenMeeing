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
<title>成员列表</title>
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
		var str = "/OpenMeeting/user/delete?linklist=" + linklist;
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
		value="删除所选成员信息" onclick="return deletelink();" />
</div>		
	<div class="container div_table">
		<div class="table-responsive">
			<table border="1" class="table table-striped table-bordered" id="fom">
				<tr>
					<th>选择</th>
					<th>用户编号</th>
					<th>用户名</th>
					<th>用户年龄</th>
					<th>用户职位</th>
					<th>用户权限</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${listuser}" var="item">
					<tr>
						<td><input type="checkbox" id="${item.userId}" name="delid" /></td>
						<td>${item.userId}</td>
						<td>${item.userName}</td>
						<td>${item.age}</td>
						<td>${item.position}</td>
						<td>
						<c:choose>
			         		<c:when test="${item.permission==0}">
			         		超管
			         		</c:when>
			         		<c:when test="${item.permission==1}">
			         		普管
			         		</c:when>
						    <c:otherwise>
						          普通用户
						    </c:otherwise>
						</c:choose>
						</td>
						<td><a
							href="/OpenMeeting/meet/checkInfo?userId=${item.userId}">查看</a></td>
					</tr>
				</c:forEach>
			</table>
			<div style="padding: 20px;">${pageStr}</div>
		</div>
	</div>
</body>
</html>
