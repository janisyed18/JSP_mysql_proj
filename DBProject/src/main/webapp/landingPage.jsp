<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%if(session.getAttribute("name")==null){
    response.sendRedirect("login.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<link href="css/landingPage.css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>LandingPage</title>
</head>
<body>
	<section class="showcase">
			<div class="video-container">
				<video src="https://assets.mixkit.co/videos/preview/mixkit-old-film-projector-working-28422-large.mp4" autoplay muted loop></video>
			</div>
			<div class="content">
				<h1>Welcome! <%=session.getAttribute("name") %></h1>
				<h3>Click on Go to experience the movie world</h3>
				<a href="index.jsp" class="btn">Go</a>
			</div>
		</section>

		<section id="about">
			<h1>About</h1>
			<p>
				This is a landing page with a full screen video background. Feel free to
				use this landing page in your projects. keep adding sections, change the
				video, content , etc
			</p>

			<h2>Follow Me On Social Media</h2>

			<div class="social">
			<a href="https://twitter.com/traversymedia" target="_blank"><i class="fab fa-twitter fa-3x"></i></a>
				<a href="https://facebook.com/traversymedia" target="_blank"><i class="fab fa-facebook fa-3x"></i></a>
				<a href="https://github.com/bradtraversy" target="_blank"><i class="fab fa-github fa-3x"></i></a>
				<a href="https://www.linkedin.com/in/bradtraversy" target="_blank"><i class="fab fa-linkedin fa-3x"></i></a>
			</div>
		</section>
</body>
</html>