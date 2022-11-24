<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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
		<div class="row">
		<form name = "form" method="post" encType = "multipart/form-data" action="writeAction.jsp?boardID=<%=boardID%>&keyValue=multipart">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="5" style="background-color: #eeeee; text-align: center;">게시판 글 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" ><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td colspan="5" ><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="5" ><input type="file" name="fileName"></td>
						</tr>
					</tbody>
				</table>
					<input type="submit" class="btn-primary pull-right" value="작성" style="background:rgb(252, 186, 44); border:none; padding:5px 18px 5px 18px;">
		</form>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>