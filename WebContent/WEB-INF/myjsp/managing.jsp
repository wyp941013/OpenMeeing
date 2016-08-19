<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="description" content="Flat, Clean, Responsive, admin template built with bootstrap 3">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">

    <title>后台管理</title>

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
                    petok: "3285f1db20753df31d6fcdae6015a30e5a60a785-1419101748-1800",
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
                        "ape": "86d42e0b8c0027bb178361fce707fc15"
                    }
                });
                ! function(a, b) {
                    a = document.createElement("script"), b = document.getElementsByTagName("script")[0], a.async = !0, a.src = "//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js", b.parentNode.insertBefore(a, b)
                }()
            }
        } catch (e) {};
        //]]>
    </script>
  


    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css"><!--微图标-->
    <link rel="stylesheet" href="../css/panel.css"><!--页面排版-->

    <link rel="stylesheet" href="../css/palette.1.css" id="skin"><!--暂时认为是色调-->
   
    <link rel="stylesheet" href="../css/main.css"><!--主要的界面排版，不可删-->


    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>	
<!--右下角隐藏调色板-->
    <div class="ob_options hidden-xs">
        <div class="options">
            <h6>COLOR SKINS</h6>
            <div class="options-container color_skins">
                <a href="../css/skins/palette.1.css" class="css_orange cs_color cs_1"></a>
                <a href="../css/skins/palette.2.css" class="css_orange cs_color cs_2"></a>
                <a href="../css/skins/palette.3.css" class="css_orange cs_color cs_3"></a>
                <a href="../css/skins/palette.4.css" class="css_orange cs_color cs_4"></a>
                <a href="../css/skins/palette.5.css" class="css_orange cs_color cs_5"></a>
                <a href="../css/skins/palette.6.css" class="css_orange cs_color cs_6"></a>
                <a href="../css/skins/palette.7.css" class="css_orange cs_color cs_7"></a>
                <a href="../css/skins/palette.8.css" class="css_orange cs_color cs_8"></a>
                <a href="../css/skins/palette.9.css" class="css_orange cs_color cs_9"></a>
                <a href="../css/skins/palette.10.css" class="css_orange cs_color cs_10"></a>
            </div>
            <h6>FONT OPTIONS</h6>
            <div class="options-container font_options">
                <select class="input-sm">
                    <option value="../css/fonts/style.1.css">Open Sans</option>
                    <option value="../css/fonts/style.2.css">Helvetica Neue</option>
                    <option value="../css/fonts/style.3.css">Montserrat &amp; Open Sans</option>
                </select>
            </div>
            <h6>LAYOUT VARIATIONS</h6>
            <div class="options-container layout_options">
                <select class="input-sm">
                    <option value="boxed.html">Boxed</option>
                    <option value="horizontal.html">Horizontal menu</option>
                    <option value="horizontal_boxed.html">Horizontal Boxed</option>
                    <option value="small-sidebar.html">Small sidebar</option>
                    <option value="right-sidebar.html">Right sidebar</option>
                    <option value="right-sidebar-collapsible.html">Right Collapsed</option>
                    <option value="both.html">Mixed Menus</option>
                    <option value="collapsible.html">Collapsible</option>
                    <option value="app.html">App</option>
                    <option value="footer.html">With footer</option>
                </select>
            </div><small class="ucase">This Panel is for demo purposes only</small>
        </div>
        <div class="ob_toggle bg-color"><span class="fa fa-cog"></span>
        </div>
    </div>
<!--右下角隐藏调色板结束-->

<!--后台显示主面板-->
    <div class="app" data-sidebar="locked">
<!--顶部-->
        <header class="header header-fixed navbar">
            <div class="brand">
                <a href="javascript:;" class="fa fa-bars off-left visible-xs" data-toggle="off-canvas" data-move="ltr"></a>
                <a href="#" class="navbar-brand">
                    <i class="fa fa-stop mg-r-sm"></i>
                    <span class="heading-font">
Open<b>Meeting</b>
</span>
                </a>
            </div>
            <form class="navbar-form navbar-left hidden-xs" role="search">
                <div class="form-group">
                    <button class="btn no-border no-margin bg-none no-pd-l" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                    <input type="text" class="form-control no-border no-padding search" placeholder="Search Workspace">
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right off-right">
                <li class="hidden-xs">
                    <a href="javascript:;">
+Gerald Theodore Morris
</a>
                </li>
                <li class="notifications dropdown hidden-xs">
                    <a href="javascript:;" data-toggle="dropdown">
                        <i class="fa fa-bell"></i>
                        <div class="badge badge-top bg-danger animated flash">3</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right animated slideInRight">
                        <div class="panel bg-white no-border no-margin">
                            <div class="panel-heading no-radius">
                                <small>
<b>Notifications</b>
</small>
                                <small class="pull-right">
<a href="javascript:;" class="mg-r-xs">mark as read</a>&#8226;
<a href="javascript:;" class="fa fa-cog mg-l-xs"></a>
</small>
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <a href="javascript:;">
                                        <span class="pull-left mg-t-xs mg-r-md">
<img src="../images/face4.jpg" class="avatar avatar-sm img-circle" alt="">
</span>
                                        <div class="m-body show pd-t-xs">
                                            <span>Dean Winchester</span>
                                            <span>Posted on to your wall</span>
                                            <small>2 mins ago</small>
                                        </div>
                                    </a>
                                </li>
                                <li class="list-group-item">
                                    <a href="javascript:;">
                                        <span class="pull-left mg-t-xs mg-r-md">
<span class="fa-stack fa-lg">
<i class="fa fa-circle fa-stack-2x text-warning"></i>
<i class="fa fa-download fa-stack-1x fa-inverse"></i>
</span>
                                        </span>
                                        <div class="m-body show pd-t-xs">
                                            <span>145 MB download in progress.</span>
                                            <div class="progress progress-xs mg-t-xs mg-b-xs">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                </div>
                                            </div>
                                            <small>Started 23 mins ago</small>
                                        </div>
                                    </a>
                                </li>
                                <li class="list-group-item">
                                    <a href="javascript:;">
                                        <span class="pull-left mg-t-xs mg-r-md">
<img src="../images/face3.jpg" class="avatar avatar-sm img-circle" alt="">
</span>
                                        <div class="m-body show pd-t-xs">
                                            <span>Application</span>
                                            <span>Where is my workspace widget</span>
                                            <small>5 days ago</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div class="panel-footer no-border">
                                <a href="javascript:;">See all notifications</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="quickmenu">
                    <a href="javascript:;" data-toggle="dropdown">
                        <img src="../images/avatar.jpg" class="avatar pull-left img-circle" alt="user" title="user">
                        <i class="caret mg-l-xs hidden-xs no-margin"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right mg-r-xs">
                        <li>
                            <a href="javascript:;">
                                <div class="pd-t-sm">
                                    gerald@morris.com
                                    <br>
                                    <small class="text-muted">4.2 MB of 51.25 GB used</small>
                                </div>
                                <div class="progress progress-xs no-radius no-margin mg-b-sm">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="profile.html">Settings</a>
                        </li>
                        <li>
                            <a href="javascript:;">Upgrade</a>
                        </li>
                        <li>
                            <a href="javascript:;">Notifications
<span class="badge bg-danger pull-right">3</span>
</a>
                        </li>
                        <li>
                            <a href="javascript:;">Help ?</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/OpenMeeting/user/logout">Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </header>

<!--中下部页面-->
        <section class="layout">
<!--侧边导航栏-->
            <aside class="sidebar canvas-left" style="position:relative;z-index:5;">

                <nav class="main-navigation">
                    <ul>
                        <li class="active">
                            <a href="/OpenMeeting/room/pagelist" target="mainFrame">
                                <i class="fa fa-coffee"></i>
                                <span>预　约</span>
                            </a>
                        </li>
                         <li class="dropdown show-on-hover">
                             <a href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-ellipsis-h"></i>
                                <span>消　息</span>
                            </a>
                             <ul class="dropdown-menu">
                                <li>
                                    <a href="/OpenMeeting/message/newMeetings" target="mainFrame">
                                        <span>最新</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/message/oldMeetings" target="mainFrame">
                                        <span>历史</span>
                                    </a>
                                </li>
                                </ul>
                        </li>
                        <li class="dropdown show-on-hover">
                            <a href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-ellipsis-h"></i>
                                <span>会　议</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/OpenMeeting/meet/ownlist" target="mainFrame">
                                        <span>所　有</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/meet/findMeetsNumByType" target="mainFrame">
                                        <span>按类型</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/meet/findMeetsNumByTime" target="mainFrame">
                                        <span>按进行情况</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/meet/pagelist" target="mainFrame">
                                        <span>allmeet</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown show-on-hover">
                            <a href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span>会议室</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/OpenMeeting/room/pagelist" target="mainFrame">
                                        <span>列　表</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/room/newpagelist" target="mainFrame">
                                        <span>查　看</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/htjsp/checkMeets.jsp" target="mainFrame">
                                        <span>goPage</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="small-sidebar.html">
                                        <span>Small sidebar</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="right-sidebar.html">
                                        <span>Right Sidebar</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="footer.html">
                                        <span>With Footer</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown show-on-hover">
                            <a href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-file"></i>
                                <span>成　员</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/OpenMeeting/htjsp/insertuser.jsp" target="mainFrame">
                                        <span>添　加</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/user/pagelist" target="mainFrame">
                                        <span>列　表</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="profile.html" target="mainFrame">
                                        <span>delete</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="404.html">
                                        <span>404 Page</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="500.html">
                                        <span>500 Page</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown show-on-hover">
                            <a href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-gift"></i>
                                <span>其　他</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/OpenMeeting/htjsp/uploadFile.jsp" target="mainFrame">
                                        <span>文　　档</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="mail_alt.html">
                                        <span>通　　告</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="email.html">
                                        <span>友情链接</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/OpenMeeting/index.jsp">
                                        <span>主　　页</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                       
                    </ul>
                </nav>


                <footer>
                    <div class="about-app pd-md animated pulse">
                        <a href="javascript:;">
                            <img src="../images/about.png" alt="">
                        </a>
                        <span>
<b>Cameo</b>&#32;is a responsive admin template powered by bootstrap 3.
<a href="javascript:;">
<b>Find out more</b>
</a>
</span>
                    </div>
                    <div class="footer-toolbar pull-left">
                        <a href="javascript:;" class="pull-left help">
                            <i class="fa fa-question-circle"></i>
                        </a>
                        <a href="javascript:;" class="toggle-sidebar pull-right hidden-xs">
                            <i class="fa fa-angle-left"></i>
                        </a>
                    </div>
                </footer>

            </aside>

<!--暂时没找到页面-->
            <aside class="chat-sidebar canvas-right pull-right">
                <div class="slimscroll" data-height="auto" data-size="6px" data-distance="0">
                    <div class="row text-white pd-md">
                        <div class="col-xs-8">
                            <p class="mg-t-xs">Mute notifications</p>
                        </div>
                        <div class="col-xs-4">
                            <input type="checkbox" class="js-switch" checked />
                        </div>
                    </div>
                    <b class="center-block text-white pd-md">
Activity feed
</b>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <span class="fa-stack fa-lg">
<i class="fa fa-circle fa-stack-2x text-warning"></i>
<i class="fa fa-download fa-stack-1x fa-inverse"></i>
</span>
                        </a>
                        Rose Fournier
                        <small>Posted on to your wall</small>
                        <br>
                        <small>2 mins ago</small>
                    </div>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <span class="fa-stack fa-lg">
<i class="fa fa-circle fa-stack-2x text-danger"></i>
<i class="fa fa-download fa-stack-1x fa-inverse"></i>
</span>
                        </a>
                        Liviu Cîndea
                        <small>Shared a photo with you.</small>
                        <br>
                        <small>13 mins ago</small>
                    </div>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <span class="fa-stack fa-lg">
<i class="fa fa-circle fa-stack-2x text-success"></i>
<i class="fa fa-download fa-stack-1x fa-inverse"></i>
</span>
                        </a>
                        Ane Marín
                        <small>Left the group(HR)</small>
                        <br>
                        <small>4 days ago</small>
                    </div>
                    <b class="center-block text-white pd-md">
Favourites
</b>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <img src="../images/face4.jpg" class="avatar avatar-sm img-circle" alt="">
                        </a>
                        <div class="user">
                            Adi Afrom
                            <i class="fa fa-circle text-danger pull-right"></i>
                        </div>
                        <small>Offline</small>
                    </div>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <img src="../images/face3.jpg" class="avatar avatar-sm img-circle" alt="">
                        </a>
                        <div class="user">
                            Leonie Horn
                            <i class="fa fa-circle text-danger pull-right"></i>
                        </div>
                        <small>Offline</small>
                    </div>
                    <b class="center-block text-white pd-md">
Friends Online
</b>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <img src="../images/face1.jpg" class="avatar avatar-sm img-circle" alt="">
                        </a>
                        <div class="user">
                            Joshua Smart
                            <i class="fa fa-circle text-warning pull-right"></i>
                        </div>
                        <small>is thinking of bananas</small>
                    </div>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <img src="../images/face3.jpg" class="avatar avatar-sm img-circle" alt="">
                        </a>
                        <div class="user">
                            娉 廖
                            <i class="fa fa-circle text-success pull-right"></i>
                        </div>
                        <small>Ready to chat</small>
                    </div>
                    <div class="pd-md">
                        <a href="javascript:;" class="pull-left mg-r-md">
                            <img src="../images/face5.jpg" class="avatar avatar-sm img-circle" alt="">
                        </a>
                        <div class="user">
                            Albert Madsen
                            <i class="fa fa-circle-o text-default pull-right"></i>
                        </div>
                        <small>idle</small>
                    </div>
                </div>
            </aside>
</section>
<!--右边的主显示界面-->
          <section class="main-content">
			<iframe src="../htjsp/welcome.jsp" style="position:relative;padding-left:200px;width:100%;height:100%;" frameborder="0" name="mainFrame" scrolling="no">
			</iframe>
        </section>
    </div>

    <script src="../js/jquery-1.11.0.js"></script>
    <script src="../js/bootstrap.js"></script> 
    <script src="../js/jquery.placeholder.js"></script>
    <script src="../js/fastclick.js"></script>
    <script src="../js/jquery.slimscroll.js"></script>
    <script src="../js/offline.min.js"></script>
    <script src="../js/off-canvas.js"></script>
    <script src="../js/main.js"></script>
	<script src="../js/modernizr.js"></script>
    <script src="../js/panel.js"></script>
    <!--隐藏色调板-->

</body>

</html>