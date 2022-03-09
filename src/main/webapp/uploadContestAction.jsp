<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO" %>
<%@ page import="file.FileDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean id="file" class="file.FileDTO" scope="page"/>
<jsp:setProperty name="file" property="title" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP FILE Uplaod</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null);{
		userID = (String) session.getAttribute("userID");
		}
		
		String directory = application.getRealPath("/uploadContestImage/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		String title = multipartRequest.getParameter("title");

		FileDAO fileDAO = new FileDAO();

		file.setFileName(fileName);
		file.setFileRealName(fileRealName);
		file.setTitle(title);
		
		if( file.getTitle() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				int result = fileDAO.write(file.getFileName(), file.getFileRealName(), file.getTitle());
				
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
					script.println("alert('Contest 저장 완료')");
					script.println("location.href = 'Press.jsp'");
					script.println("</script>");
				}
		}
	%>

</body>
</html>