<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <!-- Begin Head -->
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
        <link href="vendor/themify/themify.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/scrollbar/scrollbar.min.css" rel="stylesheet" type="text/css"/>

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
		<!-- 상단바 -->
	<% 
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
    <!--========== HEADER ==========-->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
					<span class="sr-only">Toggle navigation</span>
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
					<li role="presentation"><a href="robot.jsp">Robot</a></li>
					<li role="presentation"><a href="contact.html">Contact</a></li>			
					</ul>
				</div>
			</div>			
		</div>
	</nav>
    </header>
    <!--========== END HEADER ==========-->
    <div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="blogs">
					<div class="text-center">
						<h2>로그인</h2>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div class="g-position--relative">
        <div class="text-center">
        	<div class="g-container--md" >
            	<div class="row g-row-col--md" >
                	<div class="container">
						<div class = "col-lg-6" style=" width:80%; margin-left: 10%">
							<div class = "jumbotron" style="padding-top: 60px; opacity:0.9;">
								<form method = "post" action="loginAction.jsp">
									<div class = "form-group">
										<input type = "text" class ="form-control" placeholder="아이디" name="userID" maxlength = 20>
									</div>
									<div class = "form-group">
										<input type = "password" class ="form-control" placeholder="비밀번호" name="userPassword" maxlength = 20>
									</div>
									<input type="submit" class="btn btn-primary form-control" style="background-color:black" value = "로그인">
									<div style="padding-top:10px">
										<a href="join.jsp" class ="btn btn-primary form-control" style="background-color:tomato; width:100px">회원가입</a>
									</div>
								</form>
							</div>
						</div>
					</div>
            	</div>
    		</div>
    	</div>
    </div>
    <!--========== END PAGE CONTENT ==========-->

    <!--========== FOOTER ==========-->
	<footer>
		<div class="inner-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4 f-about">
						<a href="index.html"><h1><span>e</span>ARAI</h1></a>
						<p>자율로봇 및 인공지능 연구실은 2018년에 만들어진 신생 연구실이며, 최근 각광받고 있는 분야인 인공지능과 로보틱스를 결합하여지능을 가지고 인간과 함께 공존하며 다양한 일을 할 수 있는 로봇 시스템을 만드는 것을 목표로 하고 있습니다. 
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
						<a href="#"><p><i class="fa fa-envelope"></i> seungjoon.yi@pusan.ac.kr</p></a>
						<p><i class="fa fa-phone"></i> 051-510-7971</p>
						<p><i class="fa fa-home"></i> 부산광역시 금정구 부산대학로 63번길 2</p>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="last-div">
			<div class="container">
				<div class="row">
					<div class="copyright">
						© Pusan National University |  <a target="_blank" href="http://eec.pusan.ac.kr"> 부산대학교 전기공학과</a>
					</div>	
                    <!-- 
                        All links in the footer should remain intact. 
                        Licenseing information is available at: http://bootstraptaste.com/license/
                        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=eNno
                    -->				
				</div>
			</div>
			<a href="" class="scrollup"><i class="fa fa-chevron-up"></i></a>	
		</div>	
	</footer>
	<!--========== END FOOTER ==========-->

    <!-- Back To Top -->
    <a href="javascript:void(0);" class="s-back-to-top js__back-to-top"></a>

    <!--========== JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) ==========-->
    <!-- Vendor -->
    <script type="text/javascript" src="vendor/jquery.min.js"></script>
    <script type="text/javascript" src="vendor/jquery.migrate.min.js"></script>
    <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vendor/jquery.smooth-scroll.min.js"></script>
    <script type="text/javascript" src="vendor/jquery.back-to-top.min.js"></script>
    <script type="text/javascript" src="vendor/scrollbar/jquery.scrollbar.min.js"></script>

    <!-- General Components and Settings -->
    <script type="text/javascript" src="js/global.min.js"></script>
    <script type="text/javascript" src="js/components/header-sticky.min.js"></script>
    <script type="text/javascript" src="js/components/scrollbar.min.js"></script>
    <!--========== END JAVASCRIPTS ==========-->
</body>
</html>