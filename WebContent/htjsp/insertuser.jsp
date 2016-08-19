<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户信息添加</title>
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
	window.UMEDITOR_HOME_URL = "/OpenMeeting/ueditor/";

	var UEDITOR_HOME_URL = "/OpenMeeting/ueditor/";//从项目的根目录开始
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

	function checkForm1(form) {
		//在textarea中获得编辑器中的值
		$("#content1").val(editor.getContent());
	}
</script>
</head>
<body style="margin: 0; padding: 0;">
<div style="height:80px;"></div>
	<h1 style="text-align: center; line-height: 30px;">用户信息添加</h1>
	<form action="/OpenMeeting/user/insert" method="post" name="form"
		onsubmit="return checkForm1(this)">
		<div class="MainDiv">
			<table style="width: 90%;float:right;" border="0" cellpadding="0" cellspacing="0"
				class="CContent">

				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%;">
							<TR>
								<TD width="100%">
									<fieldset style="height: 460px;">
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>
												<td nowrap align="right" width="6%">用户昵称:</td>
												<td width="35%"><input name="userName"
													type="text" id="userName" class="text"
													style="width: 200px" title="用户昵称" value="" /></td>
												<td width="16%" align="right" nowrap="nowrap">年龄:</td>
												<td width="34%">
												    <select
													id="age" name="age" title="年龄">
														<option value="18" selected="selected">18</option>
														<c:forEach begin="18" end="110" step="1" var="temp">
														<option value="${temp}">${temp}</option>
														</c:forEach>
												</select> 

												</td>
											</tr>
											<tr>
												<td nowrap align="right" width="6%">赋予权限:</td>
												<td width="35%"><select
													id="permission" name="permission" title="用户权限">
														<option value="2" selected="selected">普通用户</option>
														<option value="1">普通管理</option>
														<option value="0">超级管理</option>
												</select></td>

												<td width="16%" align="right" nowrap="nowrap">用户职位:</td>
												<td width="34%"><input class="text" type="text"
													id="position" name="position" title="用户职位"
													style="width: 154px" value="">
												</td>
											</tr>

											<tr>
												<td align="right">用户信息:</td>
												<td colspan="10"><textarea id="content1"
														style="display: none;" name="information" title="用户信息"></textarea>
													<script id="container" name="content" type="text/plain"></script>

													<!-- 实例化编辑器 --> <script type="text/javascript">
													var editor = UE.getEditor('container');
													</script></td>
											</tr>
										</table>
										<br />
									</fieldset>
								</TD>

							</TR>

						</TABLE>
					</td>
				</tr>

				<TR>
					<TD colspan="2" align="center" height="50px"><input
						type="submit" name="Submit" value="保存" class="button" /> <input
						type="button" name="Submit2" value="返回" class="button"
						onclick="window.history.go(-1);" /></TD>
				</TR>
			</TABLE>

		</div>
	</form>
</body>
</html>
