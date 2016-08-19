<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="../js/jquery-1.11.0.js"></script>
<title>文档下载</title>
<script>
$(document).ready(function(){
	$("ul li:odd").css("background","#ccc");
    $("ul li:even").css("background","#fff");
    $("ul li:first").css("background","blue");
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

ul li div{
float:left;
height:100%;
text-align:center;
}
</style>
</head>
<body style="margin: 0; padding: 0;">
<h1 style="text-align: center; line-height: 100px;">Download Files</h1>
	<ul>
	<li><div style="width:40%;font-size:25px;">文件名</div><div style="width:30%;font-size:25px;">对应会议</div><div style="width:30%;font-size:20px;">download</div></li>
	<c:forEach items="${sessionScope.filelist}" var="item">
	<li><div style="width:40%">${item.fileName}</div><div style="width:30%">${item.meet_id}</div><div style="width:30%"><a href="/OpenMeeting/file/downloadFileFromdata?fileId=${item.fileId}">下载</a></div></li>
	</c:forEach>
	</ul>
</body>
</html>
