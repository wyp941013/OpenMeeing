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
<title>OpenMeeting</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 包含 bootstrap 样式表 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<!-- 顶部固定导航栏 -->
<link rel="stylesheet" href="css/stickup.css">
<!-- 视频播放 -->
<link rel="stylesheet" href="css/style.css">
<!--左右按钮-->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- second中的图表 -->
<link rel="stylesheet" type="text/css" href="css/normalizebar.css" />
<link rel="stylesheet" type="text/css" href="css/defaultbar.css">
<style>
.demo-chat{width: 50%;margin: 0 auto;}
.carousel-control {
	color: #444444;
	text-shadow: none;
}

.carousel-control.left, .carousel-control.right {
	background: transparent;
	background-image: none;
	filter: progid: DXImageTransform.Microsoft.gradient(enabled=false);
}

.carousel-control .icon-prev, .carousel-control .icon-next {
	font-family: FontAwesome;
}

.carousel-control .icon-prev, .carousel-control .glyphicon-chevron-left
	{
	left: 10%;
}

.carousel-control span, .carousel-control .fa {
	position: absolute;
	top: 50%;
	z-index: 5;
	display: inline-block;
	margin-top: -10px;
	width: 20px;
	height: 20px;
}

.carousel-indicators {
	bottom: 5px;
}

.carousel-indicators li {
	background-color: #dde1e7;
}

.carousel-indicators .active {
	background-color: #2dcb73;
}

#quote-carousel {
	width: 100%;
	position: relative;
}

#quote-carousel .carousel-control:hover {
	color: #444444;
}
</style>
</head>
<body>
	<!-- START THE NAVBAR -->
	<div class="navbar-wrapper">
		<div class="container">
			<div class="navwrapper">
				<div class="navbar navbar-inverse navbar-static-top">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#">OpenMeeting</a>
						</div>
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav" style="margin-left: 50%;">
								<li class="menuItem active"><a href="#First">First</a></li>
								<li class="menuItem"><a href="#Second">Second</a></li>
								<li class="menuItem"><a href="#Third">Third</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- End Navbar -->
		</div>
	</div>
	<!-- END NAVBAR -->


	<div id="main" class="container">
		<div id="First">
			<video width="100%" height="100%" poster="media/cars.png">
				<!--autoplay="autoplay"  -->
				<source src="media/cars.mp4" type="video/mp4">
				<!-- <source src="http://www.minkbooks.com/content/trailer2.mp4"
					type="video/mp4"> -->
			</video>
		</div>


		<div id="Second">
			<div class="second_left">
			<h1 style="text-align:center;">2015~2016年度</h1>
			<h1 style="text-align:center;">前七月份部门会议召开情况总览</h1>
			<div class="second_edit_font">
			　　最新的会议开展情况已于昨日（即10.03）全部完成，近几月各部门的开会次数普遍较频繁，对各方面工作的
			展开也起到了显著的提升效果。<br/>
			　　在接下来的几个月，我们一如既往的会对各部门的会议情况进行统计，对效率进行评估，希望各部门对此事能
			加大重视力度。会议的开展说明了一个部门的凝聚力以及对工作的投入精力，若不能较好的开展，各方面的工作效率可见一般。<br/>
			　　最后，预祝各部门越来越好,生意不断！
			</div>
			</div>
			<div class="second_right"> 
				<div class="htmleaf-content">
						<canvas id="canvas" height="450" width="600"></canvas>
				</div>
			</div> 
		</div>
		
		
		<div id="Third">
			<div class="row">
				<div class="col-md-12">
					<div class="carousel slide" data-ride="carousel"
						id="quote-carousel">
						<ol class="carousel-indicators">
							<li data-target="#quote-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#quote-carousel" data-slide-to="1"></li>
							<li data-target="#quote-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">

							<div class="item active">
								<div class="row">
									<div class="col-sm-8">
										<small> Bootstrap 中定义了所有的HTML 标题（h1 到 h6）的样式: </small>
										<div style="padding: 0;">
											<h6>
												我是标题6 h6. <small>我是副标题6 h6</small>
											</h6>
											<h5>
												我是标题5 h5. <small>我是副标题5 h5</small>
											</h5>
											<h4>
												我是标题4 h4. <small>我是副标题4 h4</small>
											</h4>
											<h3>
												我是标题3 h3. <small>我是副标题3 h3</small>
											</h3>
											<h2>
												我是标题2 h2. <small>我是副标题2 h2</small>
											</h2>
											<h1>
												我是标题1 h1. <small>我是副标题1 h1</small>
											</h1>
										</div>
										<small>
											&nbsp;&nbsp;&nbsp;&nbsp;如果需要向任何标题添加一个内联子标题，只需要简单地在元素两旁添加
											&lt;small&gt;，或者添加 .small
											class，这样子您就能得到一个字号更小的颜色更浅的文本，如下面实例所示<br />
										</small> <small> <i>Someone famous</i>
										</small>
									</div>
									<div class="col-sm-4">
									<div style="width:80%;margin:auto;min-width:70px;">
											<img class="img-circle" src="images/1.jpg"
												style="width: 100%; height: 100%;" alt="">
									</div>
									</div>
								</div>
							</div>

							<div class="item">
								<div class="row">
									<div class="col-sm-8">
										<small> Bootstrap 中定义了所有的HTML 标题（h1 到 h6）的样式: </small>
										<div style="padding: 0;">
											<h6>
												我是标题6 h6. <small>我是副标题6 h6</small>
											</h6>
											<h5>
												我是标题5 h5. <small>我是副标题5 h5</small>
											</h5>
											<h4>
												我是标题4 h4. <small>我是副标题4 h4</small>
											</h4>
											<h3>
												我是标题3 h3. <small>我是副标题3 h3</small>
											</h3>
											<h2>
												我是标题2 h2. <small>我是副标题2 h2</small>
											</h2>
											<h1>
												我是标题1 h1. <small>我是副标题1 h1</small>
											</h1>
										</div>
										<small>
											&nbsp;&nbsp;&nbsp;&nbsp;如果需要向任何标题添加一个内联子标题，只需要简单地在元素两旁添加
											&lt;small&gt;，或者添加 .small
											class，这样子您就能得到一个字号更小的颜色更浅的文本，如下面实例所示<br />
										</small> <small> <i>Another famous person</i>
										</small>
									</div>
									<div class="col-sm-4">
									<div style="width:80%;margin:auto;min-width:70px;">
											<img class="img-circle" src="images/2.jpg"
												style="width: 100%; height: 100%;" alt="">
									</div>
									</div>
								</div>
							</div>

							<div class="item">
								<div class="row">
									<div class="col-sm-8">
										<small> Bootstrap 中定义了所有的HTML 标题（h1 到 h6）的样式: </small>
										<div style="padding: 0;">
											<h6>
												我是标题6 h6. <small>我是副标题6 h6</small>
											</h6>
											<h5>
												我是标题5 h5. <small>我是副标题5 h5</small>
											</h5>
											<h4>
												我是标题4 h4. <small>我是副标题4 h4</small>
											</h4>
											<h3>
												我是标题3 h3. <small>我是副标题3 h3</small>
											</h3>
											<h2>
												我是标题2 h2. <small>我是副标题2 h2</small>
											</h2>
											<h1>
												我是标题1 h1. <small>我是副标题1 h1</small>
											</h1>
										</div>
										<small>
											&nbsp;&nbsp;&nbsp;&nbsp;如果需要向任何标题添加一个内联子标题，只需要简单地在元素两旁添加
											&lt;small&gt;，或者添加 .small
											class，这样子您就能得到一个字号更小的颜色更浅的文本，如下面实例所示<br />
										</small> <small> <i>The same famous person</i>
										</small>
									</div>
									<div class="col-sm-4">
									<div style="width:80%;margin:auto;min-width:70px;">
											<img class="img-circle" src="images/3.jpg"
												style="width: 100%; height: 100%;" alt="">
									</div>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>

		</div>

		<div id="footer">
			<div class="container">
				<ul class="nav nav-pills nav-justified">
					<li><a href="/OpenMeeting/user/managerlogin">网站简介</a></li>
					<li><a href="/OpenMeeting/user/managerlogin">论坛反馈</a></li>
					<li><a href="/OpenMeeting/user/managerlogin">版权声明</a></li>
					<li><a href="/OpenMeeting/login.jsp">后台管理</a></li>
					<li><a href="/OpenMeeting/userCenter.jsp">个人中心</a></li>
				</ul>
				<div class="col-md-5">
				<img class="img-circle" src="images/321.gif"
					 style="width: 100%; height: 100%;-moz-transform: rotate(180deg);"  alt="">
				</div>
				<div class="col-md-7" style="margin-top:3%;">
					<address style="text-align:center;">
						<strong>ChangShaLigong University</strong><br> 007 street<br>
						ChangSha, WanJinlu<br> <abbr title="Phone">P:</abbr>
						(0731) 456-7890
					</address>

					<address style="text-align:center;">
						<strong>Open Meeting</strong><br> <a href="mailto:#">openMeeting@somedomain.com</a>
					</address>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="js/jquery-1.11.0.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 顶部固定导航 -->
<script src="js/stickUp.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$(document).ready(function() {
			//enabling stickUp on the '.navbar-wrapper' class
			$('.navbar-wrapper').stickUp({
				parts : {
					0 : 'First',
					1 : 'Second',
					2 : 'Third',
				},
				itemClass : 'menuItem',
				itemHover : 'active'
			});
		});
	});
</script>
<!-- 视频播放 -->
<script src="js/mediaelement-and-player.min.js"></script>
<script>
	$(document).ready(function() {
		$('video').mediaelementplayer({
			alwaysShowControls : false,
			videoVolume : 'horizontal',
			features : [ 'playpause', 'progress', 'volume', 'fullscreen' ]
		});
	});
</script>
<!--最新的div滚动设置  -->
<script>
	$(document).ready(
			function() {
				$(document).on(
						'click',
						'[data-toggle="toastr"]',
						function(e) {
							e.preventDefault();
							setTimeout(function() {
								toastr.options.closeButton = true;
								toastr.info('Your campaign has been approved!',
										'System Notification');
							}, 500);
						});
			});
</script>
<script src="js/Chartbar.js"></script>
	<script>
	var randomScalingFactor = function(){ return Math.round(Math.random()*100)};

	var barChartData = {
		labels : ["January","February","March","April","May","June","July"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			}
		]

	}
	window.onload = function(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});
	}

	</script>
<!-- 
存在问题的滚动div
<script>

	var timer = setInterval('slideleft()', 5000);

	function slideleft() {
		$('#parent>div:first').animate({
			//left : parseInt($(this).attr("left"))-1170+"px"
			width : "0px"
		}, 1000, callback);
	}

	function callback() {
		$('#parent>div:last').after($('#parent>div:first'));
		$('#parent>div:last').css('width', '33.34%');
	}
</script>-->
</html>
