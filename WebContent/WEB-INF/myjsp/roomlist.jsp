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
<script>
//页面加载时更新select
window.onload=function(){
	var meetTime = document.getElementById("meetTime");
	var date = CurentTime();
	for ( var i = 0; i < 10; i++,date=addDate(date))
	{
		var txt = document.createTextNode(date);
		//2.创建节点标签  option
		var option = document.createElement('option');
		option.appendChild(txt);
		//添加子元素
		meetTime.appendChild(option);
		//alert(i);
	}
}

//日子累加
function addDate(date){
	var array = new Array();
	array = date.split("-");
	//alert("之前："+array[2]+" "+parseInt(array[2]));
	if(parseInt(array[2])<=30)
	{
		//日还没大于30，可以继续在日上累加
		if((array[2]+1)==(parseInt(array[2])+1)){
			array[2]=parseInt(array[2])+1;
			//alert("相等："+array[2]);
		}else{
			if(parseInt(array[2])+1>=10){
				//alert("等于9："+array[2]);
				array[2]++;
			}else{
				array[2] = parseInt(array[2])+1;
				array[2] ="0"+ array[2];
			}
		}
	}else
	{
		//日位上已经满31，只可以月份+1，日子归零
			if(parseInt(array[1])>=9 && parseInt(array[1])<12){
				//月份大于等于9
				array[1] = parseInt(array[1])+1;
			}else if(parseInt(array[1])==12){
				array[0]++;
				array[1] ="01";
				array[2] ="01";
			}else{
				//月份小于9
				array[1] = parseInt(array[1])+1;
				array[1] ="0"+ array[1];
			}
		
		array[2] ="01";
	}	
	var str = array[0]+"-"+array[1]+"-"+array[2];
	return str;
	
}

//获取当前日期(年月日)
function CurentTime()
{ 
    var now = new Date();
   
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
   
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
   
    var clock = year + "-";
   
    if(month < 10)
        clock += "0";
   
    clock += month + "-";
   
    if(day < 10)
        clock += "0";
       
    clock += day;
   
    return(clock); 
} 
function nihao(obj){
 var time =	document.getElementById("meetTime").value;
 var str = "/OpenMeeting/meet/timeline?roomId="+obj+"&meetTime="+time;
 location.href=str;
}
</script>
</head>
<body style="margin: 0; padding: 0;">
<div class="container div_table">
<form>
    <label>预定日期：</label>
	<select id="meetTime" name="meetTime" title="会议时间">
	</select>
</form>
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
			<td><a href="javascript:nihao(${item.roomId});">预定</a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
		<div style="padding: 20px;">${pageStr}</div>
</div>
</body>
</html>
