<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="file.FileDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>ARAI Homepage</title>
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
<body>
	<%
	String userID = null;
	
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
			script.println("alert('???????????? ?????????.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
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
						<li role="presentation"><a href="main.jsp">Home</a></li>
						<li role="presentation"><a href="team.jsp">Team</a></li>
						<li role="presentation"><a href="research.jsp">Research</a></li>
						<li role="presentation" class="active"><a href="Press.jsp">Press and Awards</a></li>
						<li role="presentation"><a href="robot.jsp">Robot</a></li>
						<li role="presentation"><a href="contact.html">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--========== END HEADER ==========-->
	<div>
		<div>
			<!-- Menu List -->                                
			<ul class="list-unstyled s-header__nav-menu">
				<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="main.jsp">Main</a></li>
				<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="team.jsp">Team</a></li>
				<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="bbs.jsp">Board</a></li>
				<% 
				if(userID == null) { // ???????????? ??? ??? ??????, ??? userID??? null??? ??? 
					%>
					<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="login.jsp">Login</a></li>
					<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="join.jsp">Join</a></li>			
					<% 
				} else { // ???????????? ????????? ?????? 
					%>	
					<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="logoutAction.jsp">Logout</a></li>
					<% 	
				}
				%>			
				<li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="contacts.jsp">Contact</a></li>					
			</ul>
		</div>
	</div>
</header>
<!--========== END HEADER ==========-->
<!--========== PROMO BLOCK ==========-->
<div class="g-bg-position--center js__parallax-window" style="background:black; margin-top:100px">
	<div class="g-container--md g-text-center--xs g-padding-y-100--xs">
		<h1 class="g-font-size-40--xs g-font-size-50--sm g-font-size-40--md g-color--white g-letter-spacing--1"></h1>
	</div>
</div>
<!--========== END PROMO BLOCK ==========-->
<div class="container g-padding-y-30--xs g-padding-y-50--sm">
	<body style="background-color:white;">
		<div class="g-container--md g-padding-y---xs">
			<div class="row g-row-col--5 g-margin-b-50--xs">
				<div class="container"> 
					<!-- ????????? ????????? ?????????  -->
					<div class = "row" style="margin-bottom: 20px">
						<form action="uploadContestAction.jsp" method="post" enctype="multipart/form-data">
							<strong>?????? ??????</strong> <input type="file" name="file">
						</div>
						<div class="row">
							<div class="form-group row">
								<label for="inputTitle" class="col-sm-2 col-form-label"><strong>??????</strong></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="?????? ??????" name="title" maxlength="50">
								</div>
							</div>
							<input type="submit" class="btn btn-primary pull-right" style="background-color:black" value="?????????">	
						</form>
					</div>
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
						<p>&nbsp???????????? ??? ???????????? ???????????? 2018?????? ???????????? ?????? ???????????????, ?????? ???????????? ?????? ????????? ??????????????? ??????????????? ????????????
							????????? ????????? ????????? ?????? ???????????? ????????? ?????? ??? ??? ?????? ?????? ???????????? ????????? ?????? ????????? ?????? ????????????.
						</p>
					</div>
						<div class="col-md-4 l-posts">
							<h3 class="widgetheading">Attended Contest</h3>
							<ul>
								<li><a href="https://www.kvrc2021.com/">KHNP ?????? ???????????? ??????????????? ????????????</a></li>
								<li><a href="https://www.kiria.org/portal/culture/portalCulContest.do;jsessionid=0D084D33EF2D8544798D57B53BBF5B08">???????????????????????? KIRIA</a></li>
								<li><a href="https://wrs.nedo.go.jp/en/">World Robot Summit</a></li>
								<li><a href="https://www.robocup.org/">Robo Cup - Home service</a></li>
							</ul>
						</div>
					<div class="col-md-4 f-contact">
						<h3 class="widgetheading">Stay in touch</h3>
						<p><i class="fa fa-envelope"></i>seungjoon.yi@pusan.ac.kr</p>
						<p><i class="fa fa-phone"></i> 051-510-7971</p>
						<p><i class="fa fa-home"></i> ??????????????? ????????? ??????????????? 63?????? 2</p>
					</div>
				</div>
				<div class="last-div">
					<div>
						?? Pusan National University | <a target="_blank" href="http://eec.pusan.ac.kr"
						style="color:white;"> ??????????????? ??????????????? </a>
					</div>
				</div>
			</div>
			<a href="" class="scrollup"><i class="fa fa-chevron-up"></i></a>
		</div>
		
		
		<a href="" class="scrollup"><i class="fa fa-chevron-up"></i></a>
	</footer>
	<!--========== END FOOTER ==========-->
	<!--========== JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) ==========-->
	<!-- Vendor -->
	<script type="text/javascript" src="vendor/jquery.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.migrate.min.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.smooth-scroll.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.back-to-top.min.js"></script>
	<script type="text/javascript" src="vendor/scrollbar/jquery.scrollbar.min.js"></script>
	<script type="text/javascript" src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.parallax.min.js"></script>
	<script type="text/javascript" src="vendor/swiper/swiper.jquery.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.wow.min.js"></script>
	
	<!-- General Components and Settings -->
	<script type="text/javascript" src="js/global.min.js"></script>
	<script type="text/javascript" src="js/components/header-sticky.min.js"></script>
	<script type="text/javascript" src="js/components/scrollbar.min.js"></script>
	<script type="text/javascript" src="js/components/magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/components/swiper.min.js"></script>
	<script type="text/javascript" src="js/components/wow.min.js"></script>
	<!--========== END JAVASCRIPTS ==========-->
</body>
</html>