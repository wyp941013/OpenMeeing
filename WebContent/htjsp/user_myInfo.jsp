<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="../js/jquery-1.11.0.js"></script>
<title>个人信息</title>
<script>
$(document).ready(function(){
	$("ul li:odd").css("background","#ccc");
    $("ul li:even").css("background","#fff");
});
</script>
<style>
*{
margin:0;
padding:0;
}


#left{
float:left;
height:200px;
width:25%;
margin-right:1%;
}

#right{
float:left;
height:1800px;
width:74%;
background:brown; 
}

#right .section{
height:500px;
}

tr{
display:block;
margin-bottom:8px;
}
#nav {list-style: none;margin: 0;position: fixed;top: 20px;width:25%;}
#nav li {margin-bottom: 2px;width:100%;}
#nav a {background: #ededed;color: #666;display: block;	font-size: 14px;padding: 5px 10px;text-align:center;text-decoration: none;text-transform: uppercase;}
#nav a:hover {background: #dedede;}
#nav .current a {background: #666;color: #ededed;}
.section {border-bottom: 5px solid #ccc;min-height: 80vh;padding: 20px;}
.section p:last-child {	margin-bottom: 0;}
</style>
</head>
<body style="margin: 0; padding: 0;">
	<div id="left">
		<ul id="nav">
	    	<li class="current"><a href="#examples">个人信息</a></li>
			<li><a href="#intro">更换密码</a></li>
			<li><a href="#usage">账号安全</a></li>
		</ul>
	</div>
	<div id="right">
		<div id="examples" class="section">
			<form action="/OpenMeeting/user/updateown" method="post">
				<table border="0" style="width:96%;margin:0 4%;">
				<caption style="font-size:39px;color:white;text-align:center;line-height:90px;">个人信息</caption>
				<tr><td align="right">昵　　称：</td><td><input type="text" name="userName" size="38" value="${sessionScope.user.userName}" style="text-align:center;"/></td></tr>
				<tr><td align="right">年　　龄：</td><td><input type="text" name="age" size="38" value="${sessionScope.user.age}" style="text-align:center;" /></td></tr>
				<tr><td align="right">账　　号：</td><td><p style="margin-left:70px;">${sessionScope.user.seqNum}</p></td></tr>
				<tr><td align="right">职　　位：</td><td><p style="margin-left:70px;">${sessionScope.user.position}</p></td></tr>
				<tr><td align="right">个人信息：</td><td><textarea style="width:260px;height:150px;" name="information">${sessionScope.user.information}</textarea></td></tr>
				<tr style="display:inline;"><td colspan="2"><div style="position:relative;left:400px;top:-300px;background:white;width:210px;height:250px;"></div>
				<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
				<input type="file" name="file" style="position:relative;top:-290px;left:430px;" value="浏览"/>
				</td></tr>
				<tr><td colspan="2" align="center">
               <input type="submit" value="更　　改" name="submit" style="border-radius:8px;position:relative;top:-240px;left:270px;width:150px;height:30px;">
				</td></tr>
				</table>
			</form>
		</div>
		<div id="intro" class="section">
　　　　　<h1 align="center">修改密码</h1>
        <form action="/OpenMeeting/user/updatePass" method="post">
        <table style="width:96%;margin-left:28%;">
        <tr><td>
        <label>原密码：</label>
        </td></tr>
        <tr><td>
        <input type="password" name="oldPass" size="38"  value="${sessionScope.user.password}" style="text-align:center;"/>
        </td></tr>
        <tr><td>
        <label>新密码：</label>
        </td></tr>
        <tr><td>
        <input type="password" name="password" onblur="checkPass();" size="38" style="text-align:center;" style="text-align:center;"/>
        <span><img id="p1" style="display:none;" src="../images/icon_ok.gif" /></span>
        </td></tr>
        <tr><td>
        <label>确认密码：</label>
        </td></tr>
        <tr><td>
        <input type="password" onblur="comparePass()" name="newpass" size="38" style="text-align:center;"/>
        <span><img id="p2" style="display:none;" src="../images/icon_ok.gif" /></span>
        </td></tr>
        <tr><td>
        <label>验证码：</label>
        </td></tr>
        <tr><td>
        <input type="text" name="checkNum" size="16" />
       </td><td>
       <img src="" alt="验证码"><font style="color:white;">点击图片更改验证码</font>
       </td></tr>
        <tr><td>
        <input type="submit" value="更改" style="border-radius:8px;position:relative;top:20px;left:270px;width:150px;height:30px;"/>
        </td></tr>
        </table>
        </form>
		</div>
		<div id="usage" class="section">
         	<h1 align="center" style="color:white;">账号安全</h1>
         	<div><label>手机绑定</label><button type="button" style="cursor:Pointer;" onclick="bindMobile()" >绑定</button></div>
         	<div><label>邮箱绑定</label><button type="button" style="cursor:Pointer;" onclick="bindMail()" >绑定</button></div>
		</div>
	</div>
</body>
<script src="../js/jquery.nav.js"></script>
<script>
$(function(){
	$('#nav').onePageNav();
});

function checkPass(){
	var pass = document.getElementsByName("password")[0];
	var str = /^[0-9A-Za-z]{8,18}$/;
	if(!str.test(pass.value)){
		document.getElementById("p1").style.display="inline";
		document.getElementById("p1").src="../images/icon_wrong.gif";		
	}else{
		document.getElementById("p1").style.display="inline";
		document.getElementById("p1").src="../images/icon_ok.gif";
	}
}

function comparePass(){
	var Firstp = document.getElementsByName("password")[0].value;
	var Secondp = document.getElementsByName("newpass")[0].value;
	if(Firstp!=Secondp){//验证两次输入的密码不一样
		document.getElementById("p2").style.display="inline";
		document.getElementById("p2").src="../images/icon_wrong.gif";
	}else{
		document.getElementById("p2").style.display="inline";
		document.getElementById("p2").src="../images/icon_ok.gif";
	}
}
</script>
</html>
