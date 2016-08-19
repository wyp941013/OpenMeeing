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
<style>
#aaa{
width:60%;
min-height:80px;
margin:0 auto;
border-bottom:1px solid #BFBFBF;
}

</style>
<script>
function selectAll() {
	var table = document.getElementById("countryTable");
	var tds = table.getElementsByTagName("td");
	var linklist="";
	//alert(tds.length);
	for ( var i = 0; i < tds.length; i++) {
		if (tds[i].childNodes[0].name == "delid") {
			linklist+=tds[i].childNodes[0].value+";";
		}
	}
	//alert(linklist);
	var ttt = document.getElementsByName("userlist")[0];
	ttt.value = linklist;
	if(linklist==""){
		alert("　　　 暂时未选择用户!!!\r\n请先选择用户后,再发送通知消息！");
		return false;
	}else{
		return true;
	}
}
</script>
</head>

<body>
<div id="aaa">
		<!-- 包括发信息的人、时间、会议标题，最新消息的时间 -->
		<font style="font-size:18px;font-weight:blod;line-height:30px;">${sessionScope.meets.meetInfo}</font>
		<br/><font style="color:#9F9696;">会议标题：</font><font style="color:blue;">${sessionScope.meets.meetTitle}</font>
		<br/><font style="color:#9F9696;">会议类型：</font><font style="color:blue;">${sessionScope.meets.meetType}</font><font style="color:red;">　设置</font>
		<br/><font style="color:#9F9696;">时　　间：${sessionScope.meets.meetTime}　${sessionScope.meets.meetStartTime}</font>
			<c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>
			<c:if test="${nowDate-sessionScope.meets.meetProTime.time < 86400000}">
			<!-- 会议预约的一天内允许选择参会人员 -->
			<div style="float:right;"><a href="/OpenMeeting/meet/checkInfo?meetId=${sessionScope.meets.meetId}" style="color:red;">人员选择</a></div>
			</c:if>
		</div>
<div class="container div_table" id="countryTable" style="max-height:350px;overflow-y:auto;margin-top:20px;margin-bottom:10px; ">
	<div class="table-responsive">
	<table border="1" class="table table-striped table-bordered">
		<tr>
			<th>编号</th>
			<th>用户名</th>
			<th>职位</th>
			<th>年龄</th>
			<th>个人信息</th>
			<th>操作</th>
		</tr>
		<c:forEach  items="${sessionScope.allUsers}" var="item">
		<tr>
        <c:set var="mm" scope="page" value="${item.user}"></c:set>
            <td><input type="hidden" name="delid" value="${item.user_id}"/><span>${item.user_id}</span></td>
            <td><%=((User)((Set<User>)pageContext.getAttribute("mm")).toArray()[0]).getUserName()%></td>
            <td><%=((User)((Set<User>)pageContext.getAttribute("mm")).toArray()[0]).getPosition()%></td>
            <td><%=((User)((Set<User>)pageContext.getAttribute("mm")).toArray()[0]).getAge()%></td>
            <td><%=((User)((Set<User>)pageContext.getAttribute("mm")).toArray()[0]).getInformation()%></td>
			<td><a href='/OpenMeeting/meet/deleteUser?meetId=${item.meet_id}&userId=${item.user_id}'>删除</a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</div>
	<div style="width:60%;margin:0 auto;">
	<form action="/OpenMeeting/message/sendMessages" onsubmit="return selectAll();" method="post">
		<table border="1" style="width:800px;height:130px;">
		<tr><td width="15%"><label>消息内容：</label></td><td><textarea name="sendInfo" cols="8" rows="15" style="width:100%;height:110px;"></textarea></td></tr>
		<tr><td colspan="2"><input type="hidden" name="userlist" /></td></tr>
		<tr><td colspan="2"><input type="submit" name="submit" value="确认发送" /></td></tr>
		</table>
	</form>
	</div>
</body>
</html>
