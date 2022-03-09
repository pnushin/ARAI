<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="robot.RobotDAO" %>
<%@ page import="robot.Robot" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="robot" class="robot.Robot" scope="page" />
<jsp:setProperty name="robot" property="robotTitle" />
<jsp:setProperty name="robot" property="robotContent" />
<jsp:setProperty name="robot" property="robotImageName" />
<jsp:setProperty name="robot" property="robotRealImageName" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta charset="utf-8">
<title>ARAI 홈페이지</title>
</head>
<body>
	<%
		//굴쓰기
		String userID = null;
		if(session.getAttribute("userID")!=null);{
		userID = (String) session.getAttribute("userID");
		}

		String directory = application.getRealPath("/uploadRobot/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";

		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

		String imageName = multipartRequest.getOriginalFileName("file");
		String robotRealImageName = multipartRequest.getFilesystemName("file");
		
		String robotTitle = multipartRequest.getParameter("robotTitle");
		String robotContent = multipartRequest.getParameter("robotContent");
		
		RobotDAO robotDAO = new RobotDAO();
		
		robot.setRobotTitle(robotTitle);
		robot.setRobotContent(robotContent);
		robot.setRobotImageName(imageName);
		robot.setRobotRealImageName(robotRealImageName);
		
	    
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else {
			if( robot.getRobotTitle() == null || robot.getRobotContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				int result = robotDAO.write(robot.getRobotTitle(), robot.getRobotContent(), robot.getRobotImageName(), robot.getRobotRealImageName());
				
				if (result==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");	
				}
				else
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('작성 완료')");
					script.println("location.href = 'robot.jsp'");
					script.println("</script>");
				}
			}
		}

	%>

</body>
</html>