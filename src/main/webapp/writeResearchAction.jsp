<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="imageName" />
<jsp:setProperty name="bbs" property="imageRealName" />
<jsp:setProperty name="bbs" property="researchName" />
<jsp:setProperty name="bbs" property="researchRealName" />

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

		String directory = application.getRealPath("/uploadResearch/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";

		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

		String imageName = multipartRequest.getOriginalFileName("file1");
		String imageRealName = multipartRequest.getFilesystemName("file1");


		String researchName = multipartRequest.getOriginalFileName("file2");
		String researchRealName = multipartRequest.getFilesystemName("file2");
		
		String bbsTitle = multipartRequest.getParameter("bbsTitle");
		String bbsContent = multipartRequest.getParameter("bbsContent");
		
		BbsDAO bbsDAO = new BbsDAO();
		
		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);
		bbs.setImageName(imageName);
		bbs.setImageRealName(imageRealName);
		bbs.setResearchName(researchName);
		bbs.setResearchRealName(researchRealName);
		
	    
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else {
			if( bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getImageName(), bbs.getImageRealName(), bbs.getResearchName(), bbs.getResearchRealName());
				
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
					script.println("location.href = 'research.jsp'");
					script.println("</script>");
				}
			}
		}

	%>

</body>
</html>