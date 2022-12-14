<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>펫뮤니티</title>
</head>
<body>
	 <%
	 	String userID = null;
	 	if(session.getAttribute("userID") != null){
	 		userID = (String) session.getAttribute("userID");
	 	}
	 	int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		
		String realFolder="";
		String saveFolder = "bbsUpload"; // 사진을 저장할 경로
		String encType = "utf-8";        // 변환 형식
		int maxSize=5*1024*1024;         // 사진의 사이즈
		
		ServletContext context = this.getServletContext(); // 절대 경로를 얻음
		realFolder = context.getRealPath(saveFolder);      // saveFolder의 절대 경로
		
		MultipartRequest multi = null;
		
		// 파일 업로드를 직접적으로 담당
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());		
		
		// form으로 전달받은 3가지를 가져옴
		String fileName = multi.getFilesystemName("fileName");
		String bbsTitle = multi.getParameter("bbsTitle");
		String bbsContent = multi.getParameter("bbsContent");
		
		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);

	 	if(userID == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	} else {
	 		if (bbs.getBbsTitle().equals("") || bbs.getBbsContent().equals("")){
	 			PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('입력이 안된 사항이 있습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	} else {
		 		BbsDAO BbsDAO = new BbsDAO();
		 		int bbsID = BbsDAO.write(boardID, bbs.getBbsTitle(), userID, bbs.getBbsContent());
		 		if (bbsID == -1){
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("alert('글쓰기에 실패했습니다.')");
			 		script.println("history.back()");
			 		script.println("</script>");
			 	}
			 	else{
			 		PrintWriter script = response.getWriter();
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(bbsID-1)+"사진.jpg");
						oldFile.renameTo(newFile);
					}
			 		script.println("<script>");
					script.println("location.href= \'bbs.jsp?boardID="+boardID+"\'");
			 		script.println("</script>");
			 	}
		 	}
	 	}
	 %>
</body>
</html>