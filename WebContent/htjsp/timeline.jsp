<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>

<meta charset="utf-8">
<meta name="description"
	content="Flat, Clean, Responsive, admin template built with bootstrap 3">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">

<title>时间表</title>

<script type="text/javascript">
        //<![CDATA[
        try {
            if (!window.CloudFlare) {
                var CloudFlare = [{
                    verbose: 0,
                    p: 0,
                    byc: 0,
                    owlid: "cf",
                    bag2: 1,
                    mirage2: 0,
                    oracle: 0,
                    paths: {
                        cloudflare: "/cdn-cgi/nexp/dok2v=1613a3a185/"
                    },
                    atok: "1668c19642567e08c574f5d9458345a2",
                    petok: "fd3d4e1fa1094cf1e08d53373793537dcb3ffd78-1419101799-1800",
                    zone: "nyasha.me",
                    rocket: "0",
                    apps: {
                        "ga_key": {
                            "ua": "UA-50530436-1",
                            "ga_bs": "2"
                        }
                    }
                }];
                CloudFlare.push({
                    "apps": {
                        "ape": "c285dd1b265c52920061e78e0a497f48"
                    }
                });
                ! function(a, b) {
                    a = document.createElement("script"), b = document.getElementsByTagName("script")[0], a.async = !0, a.src = "//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js", b.parentNode.insertBefore(a, b)
                }()
            }
        } catch (e) {};
        //]]>
	
        //检验时间是否在开放时间内，且是否与已存在会议相冲突
     function checkTime(){
    	 var textstart = document.getElementById("meetStartTime").value;
    	 var textend = document.getElementById("meetEndTime").value;
   		 var array1r =  new Array();
   	 	 array1r = textstart.split(":");
    	 var array2r =  new Array();
  	 	 array2r = textend.split(":");

   	 	 var c =array1r[0]*3600+parseInt(array1r[1])*60+parseInt(array1r[2]);
   	 	 var d =array2r[0]*3600+parseInt(array2r[1])*60+parseInt(array2r[2]);
    	 for(var i=0;i<document.getElementsByName("start").length;i++)
    	 {
    	 	var start = document.getElementsByName("start")[i].value;
    	 	var end = document.getElementsByName("end")[i].value;
    	 	//alert("时间："+start);
    	 	var array1 =  new Array();
    	 	array1 = start.split(":");
    	 	var array2 = new Array();
    	 	array2 = end.split(":");
    	 	//alert(array[0]+" "+array[1]+" "+array[2]);
    	 	var a =array1[0]*3600+parseInt(array1[1])*60+parseInt(array1[2]);
    	 	var b =array2[0]*3600+parseInt(array2[1])*60+parseInt(array2[2]);
    	 	//alert(c+" "+3600*8);
    	 	if(c<3600*8){alert("所选时段会议室暂未开放使用！");return false;}
    	 	else if(c>d){alert("会议开始时间与结束时间存在冲突！");return false;}
    	 	else if(c>b || d<a){
    	 		continue;
    	 	}else{
    	 		alert("您选择的时间与已存在的时间存在冲突！");
    	 		return false;
    	 	}
    	 }
    	 return true;
     }
    
    
    </script>


<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<!--微图标-->
<link rel="stylesheet" href="../css/panel.css">
<!--页面排版-->
<link rel="stylesheet" href="../css/palette.1.css" id="skin">
<!--暂时认为是色调-->
<link rel="stylesheet" href="../css/main.css">
<!--主要的界面排版，不可删-->
<link rel="stylesheet" href="../css/style.1.css" id="font">
<link rel="stylesheet" href="../css/animate.min.css">


<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript"
	src="/OpenMeeting/My97DatePicker/WdatePicker.js"></script>
<script src="../js/modernizr.js"></script>
</head>

<body>
	<!--后台显示主面板-->
	<div class="app">

		<!--主界面-->
		<section class="layout">

			<!--右侧时间表-->
			<section class="main-content" style="position: relative; top: 40px;">

				<div class="content-wrap">
					<div class="timeline">
						<div class="timeline-heading">Activity Timeline</div>
						<div class="timeline-panel">
							<div class="timeline-content">
								<div class="timeline-date">Time Apply</div>
								<section class="panel">
									<div class="panel-body">
										<b>Time Chosen</b>
										<div class="table-responsive">
										<form action="/OpenMeeting/meet/jumpOther" method="post">
											<table class="table" style="margin-top: 5px;">
												<tr>
													<td>开始时间：</td>
													<td><input class="text" type="text" id="meetStartTime"
														name="meetStartTime" title="会议开始时间" style="width: 154px"
														onClick="WdatePicker({readOnly:true,dateFmt:'H:dd:ss'})"
														/></td>
													<td>结束时间：</td>
													<td><input class="text" type="text" id="meetEndTime"
														name="meetEndTime" title="会议结束时间" style="width: 154px"
														onClick="WdatePicker({readOnly:true,dateFmt:'H:dd:ss'})" 
														/></td>
												</tr>
                                                <tr><td colspan="2"><input type="submit" onclick="return checkTime();" /></td></tr>
											</table>
											<input type="hidden" name="meetTime" value="${sessionScope.meetTime}" />
											</form>
										</div>
									</div>
								</section>
							</div>
						</div>
						<div class="timeline-panel">
							<div class="timeline-content">
								<div class="timeline-date">13:12 am</div>
								<section class="panel">
									<div class="panel-body">
										<a href="javascript:;" class="pull-left mg-r-md"> <img
											src="../images/avatar.jpg"
											class="avatar avatar-md img-circle" alt="">
										</a>
										<div>
											Gary Stone <small class="pull-right">6,387 Followers</small>
										</div>
										<small>San Francisco, CA</small>
										<p>
											<a href="javascript:;" class="btn btn-primary btn-xs">Added
												to circle</a>
										</p>
									</div>
								</section>
							</div>
						</div>

						<div class="timeline-heading">afternoon</div>

						<c:forEach items="${sessionScope.listmeets}" var="item">
							<div class="timeline-panel">
								<div class="timeline-content">
									<div class="timeline-date">${item.meetStartTime}~
										${item.meetEndTime}
										<input type="hidden" name="start" value="${item.meetStartTime}"/>
										<input type="hidden" name="end" value="${item.meetEndTime}"/>
										</div>
									<section class="panel">
										<div class="panel-body">
											<b>${item.meetTitle}</b>
											<p>${item.meetInfo}.</p>
										</div>
									</section>
								</div>
							</div>
						</c:forEach>

						<div class="timeline-panel">
							<div class="timeline-content">
								<div class="timeline-date">13:12 am</div>
								<section class="panel">
									<div class="panel-heading">Added to IT group</div>
									<div class="panel-body">
										<a href="javascript:;"> <img alt=""
											class="pull-left mg-r-xs avatar avatar-sm img-circle"
											src="../images/face1.jpg">
										</a> <a href="javascript:;"> <img alt=""
											class="pull-left mg-r-xs avatar avatar-sm img-circle"
											src="../images/face5.jpg">
										</a> <a href="javascript:;"> <img alt=""
											class="pull-left mg-r-xs avatar avatar-sm img-circle"
											src="../images/face3.jpg">
										</a> <a href="javascript:;"> <img alt=""
											class="pull-left mg-r-xs avatar avatar-sm img-circle"
											src="../images/face5.jpg">
										</a> <a href="javascript:;"> <img alt=""
											class="pull-left mg-r-xs avatar avatar-sm img-circle"
											src="../images/avatar.jpg">
										</a> <a href="javascript:;" class="pull-left mg-r-xs"> <span
											class="fa-stack fa-lg"> (+34) </span>
										</a>
									</div>
								</section>
							</div>
						</div>
					</div>
				</div>

			</section>

		</section>
	</div>
	<script src="../js/jquery-1.11.0.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/jquery.placeholder.js"></script>
	<script src="../js/offline.min.js"></script>
	<script src="../js/off-canvas.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/modernizr.js"></script>
	<script src="../js/panel.js"></script>
	<!--隐藏色调板-->
	<script src="../js/jquery.easing.min.js"></script>
	<script src="../js/pace.min.js"></script>

</body>

</html>