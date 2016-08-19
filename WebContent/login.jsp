<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
<script src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#font_click").bind("click",function(){
		$("input[type=submit]").click();
	});
});
</script>
<style>
*{
margin:0;
padding:0;
}

body{
background: #6EC8C7; 
}

.demo{
width:500px;
height:300px;
position:relative;
z-index:5;
top:220px;
left:33%;
background-color:rgba(204,204,204,0.4);
 -moz-border-radius: 15px;      /* Gecko browsers */
 -webkit-border-radius: 15px;   /* Webkit browsers */
 border-radius:15px;            /* W3C syntax */
}

@media \0screen\,screen\9 {/* 只支持IE6、7、8 */
  .demo{
    background-color:#ccc;
    filter:Alpha(opacity=50);
    position:static; /* IE6、7、8只能设置position:static(默认属性) ，否则会导致子元素继承Alpha值 */
    *zoom:1; /* 激活IE6、7的haslayout属性，让它读懂Alpha */
  }
  .demo p{
    position: relative;/* 设置子元素为相对定位，可让子元素不继承Alpha值 */
  }  
}

input{
background-color:rgba(135,136,102,0.3);
display:block;
width:400px;
height:35px;
line-height:100px;
margin:20px auto;
}
</style>
</head>
<body>
<img src="images/login.jpg" style="width:100%;height:100%;position:absolute;" />
	<div class="demo">
	<form action="/OpenMeeting/user/managerlogin" method="post" style="width:420px;height:300px;margin:0 auto;">
		<table>
			<tr>
				<td><h1 align="center" style="color:white;">用户登录</h1>
				</td>
			</tr>
			<tr>
				<td><input type="text" value="" name="userName" placeholder="用户名" />
				</td>
			</tr>
			<tr>
				<td><input type="password" value="" name="password" placeholder="密　码" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="登录" style="background:#385622;color:white;cursor:pointer;" />
				<font style="color:white;position:relative;top:-50px;left:90px;cursor:pointer;" id="font_click">登　　　　　　　　　　录</font>
				</td>
			</tr>
		</table>
	</form> 
	</div>
</body>
</html>