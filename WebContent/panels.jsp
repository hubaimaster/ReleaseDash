<%@page import="Objects.Document"%>
<%@page import="Objects.User"%>
<%@page import="DataBase.DataBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object userName = session.getAttribute("userName");
	Object userPassword = session.getAttribute("userPassword");
	if (userName != null && userName != null){
		User curUser = DataBase.getUser((String)userName, (String)userPassword);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>릴리즈 - 대쉬보드</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">옵션</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>릴리즈<span>대쉬보드</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg><%=curUser.userName%><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> 프로필</a></li>
							<li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> 설정</a></li>
							<li><a href="#"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> 로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="쒀치">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="dashboard.jsp"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> 임원진 대쉬보드</a></li>
			<li><a href="timetable.jsp"><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg> 관리시간표</a></li>
			<li class="active"><a href="panels.jsp"><svg class="glyph stroked app-window"><use xlink:href="#stroked-app-window"></use></svg> 릴리즈 피드</a></li>
			<li><a href="icons.jsp"><svg class="glyph stroked star"><use xlink:href="#stroked-star"></use></svg> What the Release?</a></li>
			
			<li role="presentation" class="divider"></li>
			
		</ul>

	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">		
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">릴리즈 피드</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">릴리즈 피드</h1>
			</div>
			 
		</div><!--/.row-->
		 <%
		 Document[] documents = DataBase.getDocuments("feed");
		 for (int i = 0 ; i < documents.length; i++){
			 String writeId = documents[i].writerId;
			 User writer = DataBase.getUser(writeId);
		 %>
			 
				<div class="panel panel-default">
					<div class="panel-heading">
						<%=writer.userName%> - <%=documents[i].title%>
					</div>
					<div class="panel-body">
						<p><%=documents[i].content%></p>
						<br>
						<div class="alert bg-primary" role="alert">
							<svg class="glyph stroked empty-message"><use xlink:href="#stroked-empty-message"></use></svg>김창환<p>안녕하세열<a href="#" class="pull-right"><span class="glyphicon glyphicon-remove"></span></a>
						</div>
						
						<div class="form-group">
							<label>덧글</label>
							<textarea class="form-control" rows="3"></textarea><br>
							<div align="right">
								<button type="submit" class="btn btn-primary">작성</button>
							</div>
						</div>
					
					</div>
				</div>
				
			 
	
		 <%}%>
		
	</div>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		$('#calendar').datepicker({
		});

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>
</html>
<%}else{
	response.sendRedirect("login.jsp");
}%>