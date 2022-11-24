<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.JjimDAO" %>
<%@ page import="bbs.Jjim" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://kit.fontawesome.com/764f658d1a.js" crossorigin="anonymous"></script>
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
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		Comment comment = new CommentDAO().getComment(bbsID);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp" style="padding: 5px 0px 0px 10px;">
				<img src="images/petmunity_logo.png" style="width : 90px; height : 37px; padding: 0; ">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" style="margin-left: 15px;">
				<% if (boardID == 1){ %>
					<li class="active"><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
				<%} else if(boardID == 2){ %>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li class="active"><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
				<% } else if(boardID == 3){%>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li class="active"><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
				<% } else if(boardID == 4){%>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li class="active"><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
				<% } %>
			</ul>
			<%
				if(userID == null){		//로그인이 되어있지 않은 경우
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false"><i class="fa-solid fa-power-off" style="color:rgb(252, 186, 44); padding-right: 10px;"></i><span class="caret"></span></a>
        			<ul class="dropdown-menu">
        				<li><a href="login_form.jsp">로그인 / 회원가입</a></li>
        			</ul>
         		</li>
       		</ul>
			<% 
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false"><i class="fa-solid fa-power-off" style="color:rgb(252, 186, 44); padding-right: 10px;"></i><span class="caret"></span></a>
        		<ul class="dropdown-menu">
        			<li><a href="#">마이페이지</a></li>
              		<li><a href="jjimBbs.jsp?pageNumber=1">북마크</a></li>
              		<li><a href="logout.jsp">로그아웃</a></li>
            	</ul>    
         		</li>
       		</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-5">
		<div class="container" style="padding-right: 0px; padding-left: 0px;">
			<table class="table table-haver" style="border: 1px solid #dddddd;">
					<%if(boardID == 1){%>
					<tr>
						<td colspan="5" align="left" style="background:rgb(250, 215, 140); border: 1px solid rgb(250, 215, 140); padding-top:12px"><b>&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></b></td>
						<%	JjimDAO jjimDAO = new JjimDAO();
							ArrayList<Jjim> list1 = jjimDAO.getJjim(userID, bbsID);
							if (list1.isEmpty()){ %>
						<td align="right" style="background:rgb(250, 215, 140); border: 1px solid rgb(250, 215, 140);"><button onclick = "location.href='jjimAction.jsp?bbsID=<%=bbsID%>'">북마크</button></td>
						<%	}
							else{%>
						<td align="right" bgcolor="beige"><button onclick = "location.href='jjimAction.jsp?bbsID=<%=bbsID%>'">북마크 해제</button></td>
						<%	} %>						
					</tr>
					<%} 
					if (boardID == 2){%>
					<tr>
						<td colspan="6" align="left" style="background:rgb(250, 215, 140); border: 1px solid rgb(250, 215, 140);">&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<%} %>	
					<%if (boardID == 3){%>
					<tr>
						<td colspan="6" align="left" style="background:rgb(250, 215, 140); border: 1px solid rgb(250, 215, 140);">&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<%} %>	
					<%if (boardID == 4){%>
					<tr>
						<td colspan="6" align="left" style="background:rgb(250, 215, 140); border: 1px solid rgb(250, 215, 140);">&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<%} %>
					
					<tr>
						<td colspan="3" align="left">&nbsp;&nbsp;<%= bbs.getUserID() %></td>
						<td colspan="3" align="right"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" +  bbs.getBbsDate().substring(14,16) + "분"  %></td>
					</tr>
					<% 	
					String real = "C:\\Users\\이가연\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Petmunity2\\bbsUpload";
					File viewFile = new File(real+"\\"+bbsID+"사진.jpg");
					if(viewFile.exists()){
				%>
					<tr>
						<td colspan="6"><br><br><img src = "bbsUpload/<%=bbsID %>사진.jpg" border="300px" width="300px" height="300px" ><br><br>
					<% }
					else {%><td colspan="6"><br><br><%} %>
						<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%><br><br></td>
					</tr>

					<td colspan="6" align="center">	<a href="bbs.jsp?boardID=<%=boardID %>" class="btn-primary" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px;">목록</a>
					<%
						if(userID != null && userID.equals(bbs.getUserID())){
					%>
							<a href = "update.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px;">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px;">삭제</a>
					</td>
					</tr>
					<% } %>
			</table>		
		</div>
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid rgb(250, 215, 140);">
					<tbody>
					<tr>
						<td align="left" style="background:rgb(250, 215, 140); border: 1px solid rgb(250, 215, 140);"><b>댓글</b></td>
					</tr>
					<tr>
						<%
							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList(boardID, bbsID);
							for(int i=0; i<list.size(); i++){
						%>
							<div class="container">
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
										<tr>						
										<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
										<td colspan="2"></td>
										<td align="right"><%
													if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){
												%>
														<form name = "p_search">
															<a type="button" onclick="nwindow(<%=boardID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px; ">수정</a>
															<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?bbsID=<%=bbsID %>&commentID=<%= list.get(i).getCommentID() %>" class="btn-primary" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px;">삭제</a>
														</form>															
																	
												<%
													}
												%>	
										</td>
										</tr>
										<tr>
											<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
											<% 	
												String commentReal = "C:\\Users\\이가연\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Petmunity2\\commentUpload";
												File commentFile = new File(commentReal+"\\"+bbsID+"사진"+list.get(i).getCommentID()+".jpg");
												if(commentFile.exists()){
											%>	
											<br><br><img src = "commentUpload/<%=bbsID %>사진<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>											
											<%} %>	
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
					</tr>
				</table>
			</div>
		</div>
		<div class="container">
			<div class="form-group">
			<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID%>" style="padding-left:50px;">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td style="border-bottom:none;" valign="middle"><br><br><%=userID %></td>
							<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
							<td style="width: 152px; height: 117px;"><br><br><input type="submit" class="btn-primary pull" value="댓글 작성" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px; " ></td>
						</tr>
						<tr>
							<td colspan="3"><input type="file" name="fileName"></td>
						</tr>
					</table>
			</form>
			</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	function nwindow(boardID,bbsID,commentID){
		window.name = "commentParant";
		var url= "commentUpdate.jsp?boardID="+boardID+"&bbsID="+bbsID+"&commentID="+commentID;
		window.open(url,"","width=600,height=230,left=300");
	}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>