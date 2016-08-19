<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.wyp.mybatis.model.*,java.util.Set"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="../js/jquery-1.11.0.js"></script>
<title>与我相关</title>
<script>
	$(document).ready(function() {
		$("ul li:odd").css("background", "#ccc");
		$("ul li:even").css("background", "#fff");
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
	width: 94%;
	margin: 0 auto;
}

li {
	width: 100%;
	min-height: 35px;
	border-bottom: 1px solid blue;
}
</style>
</head>
<body style="margin: 0; padding: 0;">
	<ul>
		<c:forEach items="${sessionScope.messlist}" var="item">
		<c:set var="mm" scope="page" value="${item.meet}"></c:set>
			<li>
				<div style="width: 80%; margin:0 auto;">
					<c:if test="${item.isScanF==0}">
						<div style="float: left;">
							<font color="red">*</font>
						</div>
					</c:if>
					<div style="float: left;">
						会议标题:<font style="color: blue;"><%=((Meets)((Set<Meets>)pageContext.getAttribute("mm")).toArray()[0]).getMeetTitle()%></font>
					</div>
					<div style="float: left; margin-left: 15%;">
						发送人:<font style="color: grey;"><%=((Meets)((Set<Meets>)pageContext.getAttribute("mm")).toArray()[0]).getApplyUser()%></font>
					</div>
					<div style="clear: both;">
						时间：<font style="color: blue;">${item.proTime}</font>
					</div>
					<div><font color="yellow">消息内容：</font>${item.sendInfo}</div>
					<c:if test="${item.getInfo!=null}">
						<div><font color="yellow">回复内容：</font>${item.getInfo}</div>
					</c:if>
					<c:if test="${item.isScanF==0}">
						<div>
							<form action="/OpenMeeting/message/updateTwo" method="post">
								<input type="hidden" name="id" value="${item.id}" />
								<table border="0">
									<tr>
										<td><label>能否按时到达：</label></td>
										<td>
										<select name="oryes">
											<option value="1">按时到达</option>
											<option value="0">有事请假</option>
										</select></td>
									</tr>
									<tr>
										<td><label>回复：</label></td>
										<td><textarea style="width: 450px; height: 120px;"
												name="getInfo"></textarea></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="submit" value="发送" /></td>
									</tr>
								</table>
							</form>
						</div>
					</c:if>
				</div>
			</li>
		</c:forEach>
	</ul>
</body>
</html>
