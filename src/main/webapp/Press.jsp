<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO"%>
<%@ page import="file.FileDTO"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html lang="en">
<!-- Begin Head -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ARAI Homepage</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/set1.css" />
<link href="css/overwrite.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<!-- End Head -->

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

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="blogs">
					<div class="text-center">
						<h2>Press and Awards</h2>
						<p></p>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="blog">
				<div class="container">
					<div class="slider">
						<div class="img-responsive">
							<ul class="bxslider">
							<%
								FileDAO fileDAO = new FileDAO(); 
								ArrayList<FileDTO> list = fileDAO.getList(pageNumber);
								for (int i = 0; i < list.size(); i++) {
								fileID=list.get(i).getFileID();
							%>
								<div class="sli-wrap<%=i+1%>">
									<div style="position: relative" class="sli-image">
										<img src="uploadContestImage/<%=list.get(i).getFileRealName() %>">
										<div style="position: absolute; bottom: 0px; left: 0px"
											class="sli-text">
											<h6>
												&nbsp● <%= list.get(i).getTitle() %>
												<%
													if(userID != null){
												%>
												<a href="deleteContestAction.jsp?fileID=<%=list.get(i).getFileID()%>" style="margin-left: 10px;background-color: black">삭제</a>
												<%
													}
												%>
												</h>
										</div>
									</div>
								</div>
							<%
							}
							%>
							</ul>
						</div>
						<%
							if(userID != null){
						%>
						<div style = "margin-top:10px">
							<a href="uploadContest.jsp" class="btn btn-primary pull-right" style="background-color: tomato">Award 추가하기</a>
						</div>
						<%
							}
						%>
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
						<p>&nbsp자율로봇 및 인공지능 연구실은 2018년에 만들어진 신생 연구실이며, 최근 각광받고 있는 분야인
							인공지능과 로보틱스를 결합하여 지능을 가지고 인간과 함께 공존하며 다양한 일을 할 수 있는 로봇 시스템을 만드는 것을
							목표로 하고 있습니다.</p>
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
	<a href="javascript:void(0);" class="s-back-to-top js__back-to-top"></a>
	<!--========== JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) ==========-->
	<script src="js/jquery-2.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="js/fliplightbox.min.js"></script>
	<script src="js/functions.js"></script>
	<script type="text/javascript">$('.portfolio').flipLightBox()
	</script>
	<!--========== END JAVASCRIPTS ==========-->
</body>
</html>