<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="file.FileDAO"%>
<%@ page import="file.FileDTO"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- Begin Head -->
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ARAI WEBPAGE</title>
    <meta name="keywords" content="HTML5 Theme" />
    <meta name="description" content="Megakit - HTML5 Theme">
    <meta name="author" content="keenthemes.com">

    <!-- Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i|Montserrat:400,700" rel="stylesheet">

    <!-- Vendor Styles -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/animate.css" rel="stylesheet" type="text/css"/>
    <link href="vendor/themify/themify.css" rel="stylesheet" type="text/css"/>
    <link href="vendor/scrollbar/scrollbar.min.css" rel="stylesheet" type="text/css"/>
    <link href="vendor/swiper/swiper.min.css" rel="stylesheet" type="text/css"/>
    <link href="vendor/cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css"/>

    <!-- Theme Styles -->
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/global/global.css" rel="stylesheet" type="text/css"/>

    <!-- Theme Skins -->
    <link href="css/theme/gold.css" rel="stylesheet" type="text/css"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
</head>
<!-- End Head -->

<!-- Body -->

<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	//veiw set
	int fileID = 0;
	if (request.getParameter("fileID") != null){
		fileID = Integer.parseInt(request.getParameter("fileID"));
	}
	FileDTO file = new FileDAO().getFile(fileID);
%>
	<!--========== HEADER ==========-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target=".navbar-collapse.collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse">
			<div class="menu">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><img class="navbar-brand" src="img/logo.png"></li>
					<li role="presentation" class="active"><a href="main.jsp">Home</a></li>
					<li role="presentation"><a href="team.jsp">Team</a></li>
					<li role="presentation"><a href="research.jsp">Research</a></li>
					<li role="presentation"><a href="Press.jsp">Press and Awards</a></li>
					<li role="presentation"><a href="robot.jsp">Robot</a></li>
					<li role="presentation"><a href="contact.html">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<!--========== END HEADER ==========-->

<div class="background bg-video blue">
	<div class="bg-video-wrapper">
		<video  autoplay="autoplay" loop="loop" muted="muted" width="480" height="360" playsinline="">
			<source src="main.mp4" type="video/mp4">
				<strong>Your browser does not support the video tag.</strong>
			</video>
		</div>
	</div>

	<!--========== PAGE CONTENT ==========-->
	<!--========== END SLIDE IMAGE ==========-->
	<!--========== RESEARCH ==========-->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="text-center">
					<h2>Introduction</h2>
					<p>The Autonomous Robotics and Artificial Intelligence Lab is part of the Department of Electrical
						Engineering, Pusan National University (PNU).</p>
					</div>
					<hr>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="text-center">
						<h2><a href="research.jsp">Research Interests</a></h2>
						<p></p>
					</div>
				</div>
				<div class="box">
					<div class="col-md-4">
						<div class="wow bounceIn" data-wow-offset="0" data-wow-delay="0.4s">
							<h4>Autonomous Robotics</h4>
							<div>
								**
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="wow bounceIn" data-wow-offset="0" data-wow-delay="1.0s">
							<h4>Machine Perception</h4>
							<div>
								**
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="wow bounceIn" data-wow-offset="0" data-wow-delay="1.6s">
							<h4>Situational Awareness</h4>
							<div>
								**
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="wow bounceIn" data-wow-offset="0" data-wow-delay="2.2s">
							<h4>Motion Planning</h4>
							<div>
								**
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="wow bounceIn" data-wow-offset="0" data-wow-delay="2.8s">
							<h4>Path Plannings</h4>
							<div>
								**
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="wow bounceIn" data-wow-offset="0" data-wow-delay="3.4s">
							<h4>Machine Learning</h4>
							<div>
								**
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--========== END RESEARCH ==========-->
		<!--========== PRESS AND AWARDS ==========-->

		<!--========== END PRESS AND AWARDS ==========-->
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="text-center">
						<h2><a href="Press.jsp">Press and Awards</a></h2>
						<p>
							<%
								FileDAO fileDAO = new FileDAO(); 
								ArrayList<FileDTO> list = fileDAO.getList(pageNumber);
								for (int i = 0; i < list.size(); i++) {
								fileID=list.get(i).getFileID();
							%>
							&nbsp <%= list.get(i).getTitle() %><br>
							<%
								}
							%>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!--========== FOOTER ==========-->
		<footer>
			<div class="inner-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-4 f-contact">
							<h3 class="widgetheading">ARAI</h3>
							<p>&nbsp자율로봇 및 인공지능 연구실은 2018년에 만들어진 신생 연구실이며, 최근 각광받고 있는 분야인 인공지능과 로보틱스를 결합하여
								지능을 가지고 인간과 함께 공존하며 다양한 일을 할 수 있는 로봇 시스템을 만드는 것을 목표로 하고 있습니다.
							</p>
						</div>
						<div class="col-md-4 l-posts">
							<h3 class="widgetheading">Attended Contest</h3>
							<ul>
								<li><a href="https://www.kvrc2021.com/">KHNP 원전 작업로봇 시뮬레이션 경진대회</a></li>
								<li><a href="https://www.kiria.org/portal/culture/portalCulContest.do;jsessionid=0D084D33EF2D8544798D57B53BBF5B08">국제로봇콘테스트 KIRIA</a></li>
								<li><a href="https://wrs.nedo.go.jp/en/">World Robot Summit</a></li>
								<li><a href="https://www.robocup.org/">Robo Cup - Home service</a></li>
							</ul>
						</div>
						<div class="col-md-4 f-contact">
							<h3 class="widgetheading">Stay in touch</h3>
							<p><i class="fa fa-envelope"></i>seungjoon.yi@pusan.ac.kr</p>
							<p><i class="fa fa-phone"></i> 051-510-7971</p>
							<p><i class="fa fa-home"></i> 부산광역시 금정구 부산대학로 63번길 2</p>
						</div>
					</div>
					<div class="last-div">
						<div>
							© Pusan National University |
							<a target="_blank" href="http://eec.pusan.ac.kr" style="color:white;"> 부산대학교 전기공학과 </a>
							<%
								if(userID == null) {
							%>
							|
							<a target=" blank" href="login.jsp">로그인</a>
							<%
								} else {
							%>
							| <%= userID %> |	
							<a target=" blank" href="logoutAction.jsp">로그아웃</a>
							<%
								}
							%>
							
						</div>
					</div>
				</div>
				<a href="" class="scrollup"><i class="fa fa-chevron-up"></i></a>
			</div>


			<a href="" class="scrollup"><i class="fa fa-chevron-up"></i></a>
		</footer>
		<!--========== END FOOTER ==========-->

		<!-- Back To Top -->
		<a href="javascript:void(0);" class="s-back-to-top js__back-to-top"></a>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-2.1.1.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
		<script src="js/wow.min.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.isotope.min.js"></script>
		<script src="js/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="js/fliplightbox.min.js"></script>
		<script src="js/functions.js"></script>
		<script type="text/javascript">$('.portfolio').flipLightBox()</script>
	</body>
	<!-- End Body -->

	</html>
