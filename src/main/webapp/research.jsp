<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ARAI Homepage</title>
<meta name="keywords" content="HTML5 Theme" />
<meta name="description" content="Megakit - HTML5 Theme">
<meta name="author" content="keenthemes.com">

<!-- Web Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i|Montserrat:400,700"
	rel="stylesheet">

<!-- Vendor Styles -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/animate.css" rel="stylesheet" type="text/css" />
<link href="vendor/themify/themify.css" rel="stylesheet" type="text/css" />
<link href="vendor/scrollbar/scrollbar.min.css" rel="stylesheet" type="text/css" />
<link href="vendor/swiper/swiper.min.css" rel="stylesheet" type="text/css" />
<link href="vendor/cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css" />

<!-- Theme Styles -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/global/global.css" rel="stylesheet" type="text/css" />

<!-- Theme Skins -->
<link href="css/theme/gold.css" rel="stylesheet" type="text/css" />

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


	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	//veiw set
	int bbsID = 0;
	if (request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>

	<!--========== HEADER ==========-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse.collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<div class="menu">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation"><img class="navbar-brand" src="img/logo.png"></li>
						<li role="presentation"><a href="main.jsp">Home</a></li>
						<li role="presentation"><a href="team.jsp">Team</a></li>
						<li role="presentation" class="active"><a href="research.jsp">Research</a></li>
						<li role="presentation"><a href="Press.jsp">Press and Awards</a></li>
						<li role="presentation"><a href="robot.jsp">Robot</a></li>
						<li role="presentation"><a href="contact.html">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--========== END HEADER ==========-->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="blogs">
					<div class="text-center">
						<h2>Research</h2>
						<p>
							???????????? ??? ???????????? ???????????? 2018?????? ???????????? ?????? ???????????????,<br> ?????? ???????????? ?????? ?????????
							??????????????? ??????????????? ?????????<br> ????????? ????????? ????????? ?????? ???????????? ????????? ?????? ??? ??? ??????<br>??????
							???????????? ????????? ?????? ????????? ?????? ????????????. <br>
						</p>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div class="container g-padding-y-30--xs g-padding-y-50--sm">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<%
								BbsDAO bbsDAO = new BbsDAO(); 
								ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
								for (int i = 0; i < list.size(); i++) {
								bbsID=list.get(i).getBbsID();
						%>
						<div class="page-header">
							<div class="blog">
							<h5><%=list.get(i).getBbsDate().substring(0, 11)%></h5>
								<h3><%= list.get(i).getBbsTitle() %></h3>
								<img src="uploadResearch/<%=list.get(i).getImageRealName() %>" class="img-responsive" alt="" / style="width: 900px; height: 400px; margin: 0 auto 0 auto">

								<p>&nbsp <%= list.get(i).getBbsContent()%></p>
								<div class="ficon">
									<a href="uploadResearch/<%=list.get(i).getResearchRealName() %>" alt="">Learn more</a>
								</div>
							</div>
							<%
									if(userID != null){
							%>
							<!-- <a href="update.jsp?bbsID=<%=list.get(i).getBbsID()%>" class="btn btn-primary pull-right" style="background-color: black">??????</a> -->
							<a href="deleteAction.jsp?bbsID=<%=list.get(i).getBbsID()%>" class="btn btn-primary pull-right" style="background-color: black">??????</a>
							<%
							}
							%>
						</div>
						<%
								}
						if (pageNumber != 1) {
						%>
						<a href="research.jsp?pageNumber=<%=pageNumber - 1%>"
							class="btn btn-success btn-arraw-left">??????</a>
						<%
						}
						if (bbsDAO.nextPage(pageNumber + 1)) {
						%>
						<a href="research.jsp?pageNumber=<%=pageNumber + 1%>"
							class="btn btn-success btn-arraw-left">??????</a>
						<%
						}
						%>
						<%
						if (userID != null) {
						%>
						</div>
						<div style = "margin-top:10px">
							<a href="writeResearch.jsp" class="btn btn-primary pull-right" style="background-color: tomato">?????? ????????????</a>
						</div>
						<%
						}
						%>
					
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
						<p>&nbsp???????????? ??? ???????????? ???????????? 2018?????? ???????????? ?????? ???????????????, ?????? ???????????? ?????? ?????????
							??????????????? ??????????????? ???????????? ????????? ????????? ????????? ?????? ???????????? ????????? ?????? ??? ??? ?????? ?????? ???????????? ????????? ??????
							????????? ?????? ????????????.
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
						?? Pusan National University |
						<a target="_blank" href="http://eec.pusan.ac.kr" style="color:white;"> ??????????????? ??????????????? </a>
	
						<%
							if(userID == null) {
						%>
						| <a target=" blank" href="login.jsp">?????????</a>
						<%
							} else {
						%>
						| <%= userID %> |	
						<a target=" blank" href="logoutAction.jsp">????????????</a>
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
	<!--========== JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) ==========-->
	<!-- Vendor -->
	<script type="text/javascript" src="vendor/jquery.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.migrate.min.js"></script>
	<script type="text/javascript"
		src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.smooth-scroll.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.back-to-top.min.js"></script>
	<script type="text/javascript"
		src="vendor/scrollbar/jquery.scrollbar.min.js"></script>
	<script type="text/javascript"
		src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.parallax.min.js"></script>
	<script type="text/javascript" src="vendor/swiper/swiper.jquery.min.js"></script>
	<script type="text/javascript" src="vendor/jquery.wow.min.js"></script>

	<!-- General Components and Settings -->
	<script type="text/javascript" src="js/global.min.js"></script>
	<script type="text/javascript" src="js/components/header-sticky.min.js"></script>
	<script type="text/javascript" src="js/components/scrollbar.min.js"></script>
	<script type="text/javascript"
		src="js/components/magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/components/swiper.min.js"></script>
	<script type="text/javascript" src="js/components/wow.min.js"></script>
	<!--========== END JAVASCRIPTS ==========-->
</body>
</html>