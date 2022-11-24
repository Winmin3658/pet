<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>펫뮤니티</title>
  <link rel="stylesheet" href="mainStyle.css">
  <style type="text/css"></style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="mainScript.js"></script>
  <script type="text/javascript"></script>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<header>
		<a href="main.jsp"><img src="images/petmunity_logo.png"></a>
    	<div>
      		<a href="bbs.jsp?boardID=1&pageNumber=1"><h3>자유</h3></a>
      		<a href="bbs.jsp?boardID=2&pageNumber=1"><h3>장터</h3></a>
      		<a href="bbs.jsp?boardID=3&pageNumber=1"><h3>입양</h3></a>
      		<a href="bbs.jsp?boardID=4&pageNumber=1"><h3>문의</h3></a>
      		<a href="#"><h3>채팅</h3></a>
    	</div>
    	<%
     		if (userID == null){   // login이 되지 않은 상태에서 보이는 메뉴
     	%>
     	<nav id="nav">
      		<a href="#" onclick="closeNav()">x</a>
      		<a href="bbs.jsp?boardID=1&pageNumber=1">자유</a>
      		<a href="bbs.jsp?boardID=2&pageNumber=1">장터</a>
      		<a href="bbs.jsp?boardID=3&pageNumber=1">입양</a>
      		<a href="bbs.jsp?boardID=4&pageNumber=1">문의</a>
      		<a href="#">채팅</a>
      		<a href="login_form.jsp">로그인  /  회원가입</a>
    	</nav>
    	<span id="open" onclick="openNav()">≡</span>
    	<%
     		}else{  // login이 된 사람만 볼 수 있는 메뉴
    	%>
     	<nav id="nav">
      		<a href="#" onclick="closeNav()">☓</a>
      		<a href="bbs.jsp?boardID=1&pageNumber=1">자유</a>
      		<a href="bbs.jsp?boardID=2&pageNumber=1">장터</a>
      		<a href="bbs.jsp?boardID=3&pageNumber=1">입양</a>
      		<a href="bbs.jsp?boardID=4&pageNumber=1">문의</a>
      		<a href="#">채팅</a>
      		<a href="jjimBbs.jsp?pageNumber=1">북마크</a>
      		<a href="#">마이페이지</a>
      		<a href="logout.jsp">로그아웃</a>
    	</nav>
    	<span id="open" onclick="openNav()">≡</span>
    	<% 
     		}
    	%>
	</header>

	<main>
    	<div class="slide">
      		<div></div>
      		<div>
        		<h1>우리 모두의 펫뮤니티</h1>
        		<h3>반려동물을 키우는 사람들이면<br>
          		누구나 사용할 수 있는 펫뮤니티에서 함께해요.</h3>
      		</div>
      		<input type="radio" name="pos" id="pos1" checked>
      		<input type="radio" name="pos" id="pos2">
      		<input type="radio" name="pos" id="pos3">
      		<ul>
        		<li></li>
        		<li></li>
        		<li></li>
      		</ul>
      		<p class="bullet">
        		<label for="pos1">1</label>
        		<label for="pos2">2</label>
        		<label for="pos3">3</label>
      		</p>
    	</div>
	</main>

	<article class="three">
    	<section>
      		<div OnClick="location.href ='bbs.jsp?boardID=1&pageNumber=1'" style="cursor:pointer;">
        		<h2>자유게시판</h2>
        		<p>다양한 회원들과<br>소통해보세요.</p>
      		</div>
      		<div></div>
    	</section>

    	<section>
    		<div OnClick="location.href ='bbs.jsp?boardID=2&pageNumber=1'" style="cursor:pointer;">
        		<h2>장터게시판</h2>
        		<p>회원들과의 따뜻한<br>거래를 경험해 보세요.</p>
      		</div>
      		<div></div>
    		</section>

    	<section>
      		<div OnClick="location.href ='bbs.jsp?boardID=3&pageNumber=1'" style="cursor:pointer;">
        		<h2>입양게시판</h2>
        		<p>입양 관련 소식을<br>확인해 보세요.</p>
      		</div>
			<div></div>
    	</section>
	</article>

	<article class="four">
		<section>
			<div OnClick="location.href ='bbs.jsp?boardID=4&pageNumber=1'" style="cursor:pointer;">
        		<h2>문의</h2>
        		<p>커뮤니티 이용시<br>궁금한 것이 있으면<br>언제든 물어보세요.</p>
      		</div>
      		<div></div>
    	</section>

    	<section>
      		<div OnClick="location.href ='#'" style="cursor:pointer;">
        		<h2>채팅</h2>
        		<p>회원들과 따뜻한<br>거래를 경험해 보세요.</p>
      		</div>
      		<div></div>
    	</section>
	</article>

	<footer>
    	<div>
      		<div>
      			<img src="images/petmunity_logo.png">
      			<p><a href="bbs.jsp?boardID=4&pageNumber=1">문의 게시판</a>
      			<br><br>
      			메일 문의 : petmunity@gmail.com<br>© 2022 Petmunity All Rights Reserved.</p>
      		</div>
    	</div>
  	</footer>
</body>
</html>