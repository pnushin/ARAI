<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="file.FileDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
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
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		
		if ( bbsID == 0) {
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
		} else {
				BbsDAO bbsDAO = new BbsDAO();

				   String fileDir = "uploadResearch"; //지울 파일이 존재하는 디렉토리
				
				   String fileName = bbs.getImageRealName(); //지울 파일명
				   String filePath = request.getRealPath(fileDir) + "/"; //파일이 존재하는 실제경로
				   filePath += fileName;
				   File f = new File(filePath); // 파일 객체생성
				   if( f.exists()){ 
					   f.delete(); // 파일이 존재하면 파일을 삭제한다.
				   }	
				   
				   String researchName = bbs.getResearchName(); // 지울 논문명
				   String researchPath = request.getRealPath(fileDir) + "/"; //파일이 존재하는 실제경로
				   researchPath += researchName;
				   File r = new File(researchPath); // 파일 객체생성
				   if( r.exists()){ 
					   r.delete(); // 파일이 존재하면 파일을 삭제한다.
				   }
				   
				int result = bbsDAO.delete(bbsID);
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
					script.println("location.href = 'research.jsp'"); //글 삭제에 성공하면 main page로	
					script.println("</script>");
					}
		}	
		
	%>
</body>
</html>