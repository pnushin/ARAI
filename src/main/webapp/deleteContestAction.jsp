<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="file.FileDAO" %>
<%@ page import="file.FileDTO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<<head>
<meta http-equiv = "Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta charset="utf-8">
<title>ARAI 홈페이지</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int fileID = 0;
		if (request.getParameter("fileID") != null) {
			fileID = Integer.parseInt(request.getParameter("fileID"));
		}
		if ( fileID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'research.jsp'");
			script.println("</script>");
		}
		FileDTO file = new FileDAO().getFile(fileID);
		FileDAO fileDAO = new FileDAO();
		
		   String fileName = file.getFileRealName(); //지울 파일명
		   String fileDir = "uploadContestImage"; //지울 파일이 존재하는 디렉토리
		   String filePath = request.getRealPath(fileDir) + "/"; //파일이 존재하는 실제경로
		   filePath += fileName;
		   File f = new File(filePath); // 파일 객체생성
		   if( f.exists()){ 
			   f.delete(); // 파일이 존재하면 파일을 삭제한다.
		   }
		   
		   
		int result = fileDAO.delete(fileID);
		if  (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Press.jsp'");	
			script.println("</script>");
			}
		
	%>
</body>
</html>