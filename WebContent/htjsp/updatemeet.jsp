<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会议信息修改</title>
<link rel="stylesheet" type="text/css" href="/OpenMeeting/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript" src="/OpenMeeting/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="/OpenMeeting/ueditor/Comment-ueditor.config.js"></script>
<!-- <script type="text/javascript" src="/OpenMeeting/ueditor/Topic-ueditor.config.js"></script> -->
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/OpenMeeting/ueditor/ueditor.all.js"></script>
<!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->
<script type="text/javascript"
	src="/OpenMeeting/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/OpenMeeting/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="/OpenMeeting/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
window.UMEDITOR_HOME_URL = "/OpenMeeting/umeditor/";

var UEDITOR_HOME_URL = "/OpenMeeting/umeditor/";//从项目的根目录开始
	function tishi() {
		var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
		if (a != true)
			return false;
		window
				.open(
						"冲突页.htm",
						"",
						"depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
	}

	function check() {
		document.getElementById("aa").style.display = "";
	}
	       
	
	function checkForm1(form){
	//在textarea中获得编辑器中的值
	$("#content1").val(editor.getContent());
	
	return true;
	}       
</script>
<script type="text/javascript">
$(document).ready(function() {
var nameselect=$("#mType").val();
var all_select=$("#meetType > option");

for(var i=0;i<all_select.length;i++){
    var svalue=all_select[i].text;
    if(nameselect==svalue){  //取select中所有的option的值与其进行对比，相等则令这个option添加上selected属性
     $("#meetType option[value='"+svalue+"']").attr("selected","selected");
    }
}
});

$(document).ready(function() {
	var nameselect=$("#roomI").val();
	var all_select=$("#roomId > option");

	for(var i=0;i<all_select.length;i++){
	    var svalue=all_select[i].text;
	    if(nameselect==svalue){  //取select中所有的option的值与其进行对比，相等则令这个option添加上selected属性
	     $("#roomId option[value='"+svalue+"']").attr("selected","selected");
	    }
	}
	});

$(document).ready(function() {
var nameselect=$("#Position").val();
var all_select=$("#meetPosition > option");

for(var i=0;i<all_select.length;i++){
    var svalue=all_select[i].text;
    if(nameselect==svalue){  //取select中所有的option的值与其进行对比，相等则令这个option添加上selected属性
     $("#meetPosition option[value='"+svalue+"']").attr("selected","selected");
    }
}
});
</script>
<style type="text/css">
body,html{
	text-align:left;
}
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->

*{
margin:0;
padding:0;
}
</style>
</head>
<body class="ContentBody" style="margin:0;padding:0;">
	<form action="meet_meetUpdate.action" method="post"  name="form"  onsubmit="return checkForm1(this)">
		<div class="MainDiv">
			<table style="width:99%;"border="0" cellpadding="0" cellspacing="0"
				class="CContent">
				<tr>
					<th class="tablestyle_title">会议信息修改</th>
				</tr>
				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width:100%;">
							<TR>
								<TD width="100%">
									<fieldset style="height:460px;">
										<legend>会议修改</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width:100%">

											<tr>
												<td nowrap align="right" width="6%">会议标题:</td>
												<td width="35%"><input name="meetTitle" type="text"
													id="meetTitle" class="text" style="width:200px" title="会议标题" value="${meets.meetTitle}" /> 
												</td>
												<td width="16%" align="right" nowrap="nowrap">会议类型:</td>
												<td width="34%"><!-- <input class="text" name="achi.achievementType"
													style="width:154px" title="成果类型" value="" /> -->
													<select id="meetType" name="meetType" title="会议类型">
														<option value="新生动员" selected="selected">新生动员</option>
														<option value="技术讨论">技术讨论</option>
														<option value="部门例会">部门例会</option>
													</select>
													<input type="hidden" id="mType" value="${meets.meetType}" />
												</td>
											</tr>
											<tr>
												<td nowrap align="right" width="6%">会议主持:</td>
												<td width="35%"><input name="meetManager" type="text"
													id="meetManager" class="text" style="width:200px" title="会议主持" value="${meets.meetManager}" /> 
												</td>
												
												<td width="16%" align="right" nowrap="nowrap">会议时间:</td>
												<td width="34%"><input class="text" type="text" id="meetTime" value="${meets.meetTime}"
												name="meetTime" title="会议时间"
													style="width:154px" onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd H:mm:ss'})">
												</td>
											</tr>
											<tr>
												<td width="16%" align="right" nowrap="nowrap">会议地点:</td>
												<td width="34%">
												<select id="roomId" name="roomId" title="会议地点">
														<option value="1" selected="selected">B-211</option>
														<option value="1">C-509</option>
														<option value="1">B-210</option>
												</select>
												<input type="text" id="roomI"
													style="width:200px" title="会议地点" value="${meets.roomId}" /> 
												</td>
												
												<td width="16%" align="right" nowrap="nowrap">会议等级:</td>
												<td width="34%"><!-- <input class="text" name="achi.achievementType"
													style="width:154px" title="成果类型" value="" /> -->
													<select id="meetPosition" name="meetPosition" title="会议等级">
														<option value="普通级别" selected="selected">普通级别</option>
														<option value="主管级别">主管级别</option>
														<option value="全体员工">全体员工</option>
													</select>
													<input type="hidden" id="Position" value="${meets.meetPosition}" />
													<input type="hidden" name="meetId" value="${meets.meetId}" />
												</td>
											</tr>


											<tr>
												<td align="right">会议信息:</td>
												<td colspan="10">
<textarea id="content1" style="display:none;" name="meetInfo" title="会议信息"></textarea>												
<script id="container" name="content" type="text/plain">${meets.meetInfo}</script>

    <!-- 实例化编辑器 -->
 <script type="text/javascript">
        var editor = UM.getEditor('container');
    </script> 
        
        
												</td>
											</tr>
										</table>
										<br />
									</fieldset>
									</TD>

							</TR>

						</TABLE></td>
				</tr>

				<TR>
					<TD colspan="2" align="center" height="50px">
					<input type="submit" name="Submit" value="保存" class="button"
					 /> 
					<input type="button" name="Submit2"
						value="返回" class="button" onclick="window.history.go(-1);" />
					</TD>
				</TR>
			</TABLE>

		</div>
	</form>

</body>
</html>

