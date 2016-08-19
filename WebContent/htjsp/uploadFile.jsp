<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会议查看及文件上传、下载</title>
<style>
*{
margin:0;
padding:0;
font-size:14px;
}

#filelist{
width:120px;
}

#filelist table{
width:100%;
}
</style>
</head>
<body style="margin:0;padding:0;">
<div style="height:80px;width:100px;"></div><!-- 顶部空行 -->
<div id="filelist">
<table>
<tr><td>文件名</td><td>操作</td></tr>
<c:forEach  items="${sessionScope.filelist}" var="item">
<tr><td>${item.fileName}</td><td><a href="/OpenMeeting/file/downloadFileFromdata?fileId=${item.fileId}">下载</a></td></tr>
</c:forEach>
</table>
</div>

<form action="/OpenMeeting/file/upFileTodata" method="post" enctype="multipart/form-data">
 <input type="file" name="upFile" />
 <input type="hidden" name="meet_id" value="${sessionScope.meetId}" />
 <input type="submit" value="提交" />
</form>
</body>
</html>
