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
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/userCenter.css">
<title>个人中心</title>
</head>
<body>
	<div id="top">
	<img src="./images/meet.jpg" style="width:100%;height:100%"/>
	</div>
	<div id="main">
		<div id="link">
			<ul>
			<li><span><a href="index.jsp">首　　页</a><font>|</font></span></li>
			<li><span><a href="/OpenMeeting/userCenter/ownlist" target="mainFrame">我的会议</a><font>|</font></span></li>
			<li><span><a href="/OpenMeeting/userCenter/getMessageAboutMe" target="mainFrame">与我相关</a><font>|</font></span></li>
			<li><span><a href="/OpenMeeting/userCenter/myInfo" target="mainFrame">信息修改</a><font>|</font></span></li>
			<li><span><a href="/OpenMeeting/userCenter/ownlist?tz=dss" target="mainFrame">下载文档</a></span></li>
			</ul>
		</div>
		<!-- 顶部导航结束 -->
		<div id="main-content">
			<iframe src="/OpenMeeting/userCenter/ownlist" style="width:100%;min-height:550px;" frameborder="0"  name="mainFrame" scrolling="no"
						 id="ifm" onload="javascript:dyniframesize('ifm');" >
			</iframe>
		</div>
	</div>
</body>
<script src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
function dyniframesize(down) {
var pTar = null;
if (document.getElementById){
pTar = document.getElementById(down);
}
else{
eval('pTar = ' + down + ';');
}
if (pTar && !window.opera){
//begin resizing iframe
pTar.style.display="block"
if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){
//ns6 syntax
pTar.height = pTar.contentDocument.body.offsetHeight +20;
pTar.width = pTar.contentDocument.body.scrollWidth+20;
}
else if (pTar.Document && pTar.Document.body.scrollHeight){
//ie5+ syntax
pTar.height = pTar.Document.body.scrollHeight;
pTar.width = pTar.Document.body.scrollWidth;
}
}
}
</script> 
<script>
jQuery(function($) {
	$(document).ready(function() {
		$("#link").find("li").hover(function(){
			$(this).find("span").css("border-color","yellow");	
		},
		function(){
			$(this).find("span").css("border-color","blue");		
		});
	});
});
</script>
</html>
