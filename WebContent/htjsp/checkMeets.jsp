<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会议信息修改</title>
<script src="../js/jquery-1.11.0.js"></script>
<style>
.optionOver{
background:blue;
}
</style>
</head>
<body>
<div style="height:80px;"></div>
<div style="border:1px solid blue;width:600px;height:450px;margin:0 auto;">
<div style="background:blue;width:100%;height:50px;text-align:center;line-height:50px;font-size:22px;">参会人员选择</div>
	<table style="width:600px;height:380px;text-align:center;">
	<tr>
	<td colspan="2">
	<input type="text" id="mytext"  name="textfield" size="34" oninput="immediately();" style="border:1px solid #1583DD;"/>
	<!-- onpropertychange="immediately();" -->
	</td>
	<td></td>
	<td>已选参会人：<font id="hasChosen"></font>/50</td>
	</tr>
		<tr>
			<td colspan="2" valign="top" width="47%">
			<select multiple="multiple" id="uncountryTable" name="uncountryTable"
				style="height: 300px; width: 245px;background:#EEEFFA;">
				<c:forEach items="${sessionScope.allUsers}" var="item">
				<option value="${item.userId}">${item.userName}</option>
				</c:forEach>
			</select>
			</td>
			<td align="center">
			<button id="leftToRight">>>></button>
			</td>
			<td colspan="2" valign="top" width="47%">
			<select multiple="multiple" id="countryTable" name="countryTable"
				style="height: 300px; width: 245px;background:#EEEFFA;">
			</select>
			</td>
		</tr>
		<tr>
		<td colspan="4" style="text-align:center"><input type="button" onclick="subb();" value="确认选择" /></td>
		</tr>
	</table>
	<input type="hidden" id="meetId" value="${sessionScope.meetId}" />
</div>	

</body>
<script>
//左边选项被双击，添加到右边
jQuery(document).ready(function() {       
    jQuery("#uncountryTable").dblclick(function(){  
                    jQuery("#uncountryTable option:selected").each(function(){  
                        var option = "<option value='"+jQuery(this).val()+"'>"+jQuery(this).text()+"</option>";                   
                        jQuery("#countryTable").append(option);  
                        jQuery(this).remove();  
                    });  
                });   
    });  
//左边选项被选择，点击>>>，选项添加到右边
jQuery(document).ready(function() {       
    jQuery("#leftToRight").click(function(){  
                    jQuery("#uncountryTable option:selected").each(function(){  
                        var option = "<option value='"+jQuery(this).val()+"'>"+jQuery(this).text()+"</option>";                   
                        jQuery("#countryTable").append(option);  
                        jQuery(this).remove();  
                    });  
                });   
    });  
    
//右边选项被双击，添加到左边  
jQuery(document).ready(function() {       
    jQuery("#countryTable").dblclick(function(){  
                    jQuery("#countryTable option:selected").each(function(){  
                        var option = "<option value='"+jQuery(this).val()+"'>"+jQuery(this).text()+"</option>";                   
                        jQuery("#uncountryTable").append(option);  
                        jQuery(this).remove();  
                    });  
                });   
    }); 
    
//鼠标划过option变色  
$(function(){
	  $('option').hover(function(){
	    $(this).addClass('optionOver');  
	   },function(){
	    $(this).removeClass('optionOver'); 
	   }
	  );
	 });

var selectId1 = document.getElementById("uncountryTable");
var obj1 = selectId1.options;
var length = obj1.length;
//创建一个二维数组保存
var tArray = new Array();   //先声明一维
	for(var k=0;k<length;k++){        //一维长度为i,i为变量，可以根据实际情况改变
		tArray[k]=new Array();    //声明二维，每一个一维数组里面的一个元素都是一个数组；
	for(var j=0;j<2;j++){      //一维数组里面每个元素数组可以包含的数量p，p也是一个变量；
		tArray[k][j]="";       //这里将变量初始化，我这边统一初始化为空，后面在用所需的值覆盖里面的值
	 }
	}
//暂时储存select中的原内容
window.onload = function(){
	
	for ( var i = 0; i <length; i++) {
		tArray[i][0]=obj1[i].text;
		tArray[i][1]=obj1[i].value
	  }
	//alert(tArray);
}

//根据输入字符实时列出类似答案
function immediately(){
	var element = document.getElementById("mytext");
	if("\v"=="v") {//浏览器支持判断
	element.onpropertychange = webChange;
	}else{
	element.addEventListener("input",webChange,false);
	}
	function webChange(){
	if(element.value){
		//处理输入框的值更改以后的反应
		var textinput = element.value;
		var selectId = document.getElementById("uncountryTable");
		selectId.innerHTML = ""//原有的select下的option清零
		var obj =tArray;
		var length = tArray.length;
		//alert(length);
		if(textinput.trim()!=""){
		for ( var i = 0; i <length; i++) {
			//alert(obj[i][0].indexOf(textinput.trim()));
			 if (obj[i][0].toUpperCase().indexOf(textinput.trim().toUpperCase())>=0) {
			    selectId.options.add(new Option(obj[i][0],obj[i][1])); 
			}  
		  }
		}else if(textinput.trim()==""){//输入框值为空时，显示所有元素
			//alert(textinput.trim());
			for ( var i = 0; i <length; i++) {
				    selectId.options.add(new Option(obj[i][0],obj[i][1])); 
			  }
		}
		};
	}
}

//提交已经选择的用户信息
function subb(){
	var haveselectId = document.getElementById("countryTable");
	var ob2 = haveselectId.options;
	var length = ob2.length;
	var allchosen ="";  //先声明一维
	for( var i = 0; i <length; i++) {
		allchosen+=ob2[i].value+";";
		 }
	//alert(allchosen);
	var meetId= document.getElementById("meetId");
	var str5 = "/OpenMeeting/meet/addmeetuser?userlink="+allchosen+"&meetId="+meetId.value;
	//alert(str5);
	location.href=str5;
}
</script>
</html>