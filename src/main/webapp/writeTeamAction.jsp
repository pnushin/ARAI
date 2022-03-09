<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="team.TeamDAO" %>
<%@ page import="team.Team" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="team" class="team.Team" scope="page" />
<jsp:setProperty name="team" property="memberName" />
<jsp:setProperty name="team" property="memberIntro" />
<jsp:setProperty name="team" property="IDPhotoName" />
<jsp:setProperty name="team" property="IDPhotoRealName" />

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

		String directory = application.getRealPath("/uploadIDPhoto/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";

		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

		String IDPhotoName = multipartRequest.getOriginalFileName("file");
		String IDPhotoRealName = multipartRequest.getFilesystemName("file");
		
		String memberName = multipartRequest.getParameter("memberName");
		String memberIntro = multipartRequest.getParameter("memberIntro");
		
		TeamDAO teamDAO = new TeamDAO();
		
		team.setMemberName(memberName);
		team.setMemberIntro(memberIntro);
		team.setIDPhotoName(IDPhotoName );
		team.setIDPhotoRealName(IDPhotoRealName);
		
	    
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else {
			if( team.getMemberName() == null || team.getMemberIntro() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				int result = teamDAO.write(team.getMemberName(), team.getMemberIntro(), team.getIDPhotoName(), team.getIDPhotoRealName());
				
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
					script.println("location.href = 'team.jsp'");
					script.println("</script>");
				}
			}
		}

	%>

</body>
</html>