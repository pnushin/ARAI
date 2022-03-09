<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="robot.RobotDAO"%>
<%@ page import="robot.Robot"%>
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
	int robotID = 0;
	if (request.getParameter("robotID") != null){
		robotID = Integer.parseInt(request.getParameter("robotID"));
	}
	Robot robot = new RobotDAO().getRobot(robotID);
	%>

	<!--========== HEADER ==========-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
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
						<li role="presentation"><a href="Press.jsp">Press and Awards</a></li>
						<li role="presentation" class="active"><a href="robot.jsp">Robot</a></li>
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
						<h2>Robot</h2>
						<p>ARAI is making many robots and doing research to perform tasks. <br>
						</p>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<!--========== END PROMO BLOCK ==========-->
	<div class="container g-padding-y-30--xs g-padding-y-50--sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<%
						RobotDAO robotDAO = new RobotDAO(); 
						ArrayList<Robot> list = robotDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
						robotID=list.get(i).getRobotID();
					%>
					<div class="page-header">
						<div class="blog">
							<h5><%=list.get(i).getRobotDate().substring(0, 11)%></h5>
							<img src="uploadRobot/<%=list.get(i).getRobotRealImageName() %>" class="img-responsive"alt="" />
	
							<h3><%= list.get(i).getRobotTitle() %></h3>
							<p><%= list.get(i).getRobotContent()%>
							</p>
<!-- 	리서치 업데이트				<div class="ficon">
									<a href="researches/IROS_2019_Poster.pdf" alt="">Learn more</a>
								</div> -->
						</div>
						<%
							if(userID != null){
						%>
			<!-- <a href="update.jsp?bbsID=<%=list.get(i).getRobotID()%>" class="btn btn-primary pull-right" style="background-color: black">수정</a> -->
							<a href="deleteRobotAction.jsp?robotID=<%=list.get(i).getRobotID()%>" class="btn btn-primary pull-right" style="background-color: black">삭제</a>
						<%
							}
						%>
					</div>
						<%
							}
							if (pageNumber != 1) {
						%>
							<a href="robot.jsp?pageNumber=<%=pageNumber - 1%>"
							class="btn btn-success btn-arraw-left">이전</a>
						<%
							}
							if (robotDAO.nextPage(pageNumber + 1)) {
						%>
							<a href="robot.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
						<%
							}
						%>
						</div>
						<%
							if (userID != null) {
						%>
				<div style = "margin-top:10px">
						<a href="writeRobot.jsp" class="btn btn-primary pull-right" style="background-color: tomato">로봇 추가하기</a>
				</div>
			<%
				}
			%>
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