<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<head>
<!-- Basic -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ARAI Hompage</title>
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
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'research.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'research.jsp'");
			script.println("</script>");
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
					<li role="presentation"><a href="team.html">Team</a></li>
					<li role="presentation" class="active"><a href="research.jsp">Research</a></li>
					<li role="presentation"><a href="Press.html">Press and Awards</a></li>
					<li role="presentation"><a href="robot.html">Robot</a></li>
					<li role="presentation"><a href="contact.html">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<!--========== END HEADER ==========-->
    <div class="container g-padding-y-30--xs g-padding-y-50--sm" style="margin-top:250px">
    	<body style="background-color:white;">
            	<div class="g-container--md g-padding-y---xs">
                	<div class="row g-row-col--5 g-margin-b-50--xs">
                    	<div class="container">  <!-- 게시판 글쓰기 페이지  -->
							<div class = "row" style="margin-bottom: 20px">
								<form name="form" method="post" action="updateAction.jsp?bbsID=<%=bbsID %>" enctype = "multipart/form-data">
									<strong>대표 사진</strong> <input type="file" name="file">
									</div>
									<div class="form-group row">
							            <label for="inputTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
							            <div class="col-sm-10">
							                <input type="text" class="form-control" placeholder="논문 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>">
							            </div>
							        </div>
							        <div class="form-group row">
							            <label for="inputContent" class="col-sm-2 col-form-label"><strong>내용</strong></label>
							            <div class="col-sm-10">
							                <textarea class="form-control" placeholder="간락한 설명" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent()%></textarea>
							            </div>
							        </div>
									<input type="submit" class="btn btn-primary pull-right" style="background-color:black" value="글수정">	
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
							<p>&nbsp자율로봇 및 인공지능 연구실은 2018년에 만들어진 신생 연구실이며, 최근 각광받고 있는 분야인 인공지능과 로보틱스를 결합하여
								지능을 가지고 인간과 함께 공존하며 다양한 일을 할 수 있는 로봇 시스템을 만드는 것을 목표로 하고 있습니다.
							</p>
						</div>
						<div class="col-md-4 l-posts">
							<h3 class="widgetheading">Latest Posts</h3>
							<ul>
								<li><a href="#">This is awesome post title</a></li>
								<li><a href="#">Awesome features are awesome</a></li>
								<li><a href="#">Create your own awesome website</a></li>
								<li><a href="#">Wow, this is fourth post title</a></li>
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
							© Pusan National University | <a target="_blank" href="http://eec.pusan.ac.kr"
							style="color:white;"> 부산대학교 전기공학과 </a>
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