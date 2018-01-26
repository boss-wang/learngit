<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>欢迎使用</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/animate.min.css" rel="stylesheet">
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link href="css/form.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/icons.css" rel="stylesheet">
		<link href="css/generics.css" rel="stylesheet">
        <link rel="stylesheet" href="css/add.css" />
		
</head>


<body id="skin-blur-blue">
		<header id="header" class="media">
			<a id="menu-toggle"></a>
			<a class="logo pull-left" href="">昵称</a>

			<div class="media-body">
				<div class="media" id="top-menu">
					<div id="second" style="width: 50px ;height: 50px;float: right;font-size: 20px;padding-top: 10px; margin-right: 4px;"></div>
					<div id="time" class="pull-right">
						
					</div>
					
					<div class="media-body">
						<input type="text" class="main-search" placeholder="搜索内容">
					</div>
				</div>
			</div>
		</header>
		
		<aside id="sidebar">

			<!-- 头像-->
			<div class="side-widgets overflow">
				<!-- Profile Menu -->
				<div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
					<a href="" data-toggle="dropdown">
						<img class="profile-pic animated" src="img/profile-pic.jpg" alt="">
					</a>
				</div>
				<!-- 职位描述 -->
				<div class="s-widget m-b-25">
					<div class="s-widget-body">
						<div class="side-border">
							<h5>职位描述</h5>

						</div>

					</div>
				</div>
			</div>
			<!-- Side Menu -->
			
			<ul class="list-unstyled side-menu">
				    <li class="active">
                        <a class="sa-side-home" href="">
                            <span class="menu-item">主界面</span>
                        </a>
                    </li>
				<li class="dropdown">
					<a class="sa-side-form" href="">
						<span class="menu-item">员工管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a id="addUser">添加员工</a>
						</li>
						<li>
							<a >修改员工角色</a>
						</li>
						<li>
							<a id="delUser">删除员工</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-form2" href="">
						<span class="menu-item">客户管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a href="form-elements.html">添加客户</a>
						</li>
						<li>
							<a href="form-components.html">修改客户信息</a>
						</li>
						<li>
							<a href="form-examples.html">删除客户</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-ui" href="">
						<span class="menu-item">所有订单管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a id="addOrder">新建订单</a>
						</li>
						<li>
							<a href="labels.html">查看所有人订单</a>
						</li>
						<li>
							<a href="images-icons.html">修改订单</a>
						</li>
						<li>
							<a href="alerts.html">删除订单</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-page" href="">
						<span class="menu-item">本人订单管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a href="list-view.html">新建订单</a>
						</li>
						<li>
							<a href="profile-page.html">查看订单</a>
						</li>
						<li>
							<a href="messages.html">修改订单</a>
						</li>
						<li>
							<a href="login.html">删除订单</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-form3" href="">
						<span class="menu-item">供应商管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a href="form-elements.html">添加供应商</a>
						</li>
						<li>
							<a href="form-components.html">修改供应商信息</a>
						</li>
						<li>
							<a href="form-examples.html">删除</a>
						</li>
					</ul>
				</li>
			</ul>
			
		</aside>
		<section id="home"></section>
		<!--  <iframe src="/dtw/admin/addUser.jsp" style="border: 0px;" width="1300px" height="800px"></iframe> -->
	</body>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
	<script type="text/javascript" src="js/time.js"></script>
	<script type="text/javascript" src="js/hiddenlist.js" ></script>
	<script type="text/javascript">
		
		$("#addUser").click(function(){
			$("#home").load("/dtw/admin/addUser.jsp");
		})
		$("#delUser").click(function(){
			$("#home").load("/dtw/showUser");
		})
		$("#addOrder").click(function(){
			$("#home").load("/dtw/admin/addOrder.jsp");
		})
	</script>
</html>