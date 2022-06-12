<%@page import="controller.Actor"%>
<%@page import="controller.FilmActor"%>
<%@page import="java.util.List"%>
<%@page import="controller.Film"%>
<%@page import="DAO.DBConnect"%>
<%@page import="controller.FilmDAO"%>
<%@ page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous"
>
<link
	rel="stylesheet"
	href="https://cdnjs.cloudflareg.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous"
	referrerpolicy="no-referrer"
/>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />

<style type="text/css">
.dashboard-container {
background-color: #fff !important;}
.masthead .masthead-heading {
color: black;
    text-transform: capitalize !important;
}

#mainNav {
padding: unset !important;
    background-color: #6c63ff !important;
    position: unset !important;
}
#mainNav .navbar-nav li.nav-item a.nav-link:hover {
  color: #fff !important;
 
}
.masthead .masthead-avatar {
width: unset !important;}

.movie-card {
}

.movie-desc {
margin-top: 24px;}

</style>
</head>
<body>
<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Movie Buzz</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Movies</a></li>
					<li class="nav-item mx-0 mx-lg-1">
					<form method ="post" class="wrapper" action="actorSearch.jsp">
					<a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="actorSearch.jsp">Actors</a>
						</form>
						</li>
						
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Movie rentals</a></li>
					
						<li class="nav-item mx-0 mx-lg-1">
						<form method ="post" class="wrapper" action="search.jsp">
						<a
							class="nav-link py-3 px-0 px-lg-3 rounded" href="search.jsp">Search</a>
							</form>
							</li>	
							
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name") %></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	     

	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<%
									int id = Integer.parseInt(request.getParameter("id"));
									FilmDAO dao = new FilmDAO(DBConnect.getConnection());
									Film f = dao.getFilmById(id);
									%>
				<p class="fs-4 movie-desc">Movie Description / <span class="movie-name"> <%=f.getTitle()%> </span></p>
				<div class="movie-card"> 
					<div class="card-body">
						<div class="row">
							<div class="col-md-4">
								<img
									alt=""
									src="https://m.media-amazon.com/images/M/MV5BZGI1NDg3NjItZGM2ZC00YWNkLTk1ZjUtYTc2N2MwOGRlZTJhXkEyXkFqcGdeQXVyODQ4MjU1MDk@._V1_.jpg"
									width="300px";
									style="object-fit: cover;
  
    height: 420px;
}"
								>
							</div>
							<div class="col-md-8 ">
								<table class="table table-borderless">
									
									<tbody>
										<tr>
											<th scope="row">Title</th>
											<th>:</th>
											<td><%=f.getTitle()%></td>
										</tr>
										<tr>
											<th scope="row">Release Year</th>
											<th>:</th>
											<td><%=f.getRelaseYear()%></td>
										</tr>
										<tr>
											<th scope="row">Length</th>
											<th>:</th>
											<td><%=f.getLength()%></td>
										</tr>
										<tr>
											<th scope="row">Rating</th>
											<th>:</th>
											<td><%=f.getRating()%></td>
										</tr>
										<tr>
											<th scope="row">Category</th>
											<th>:</th>
											<td>
												<%
												int cid = dao.getCategory(f.getFilmId());
												String categoryName = dao.getCategoryName(cid);
												out.print(categoryName);
												%>
											</td>
										</tr>
										<tr>
											<th scope="row">Description</th>
											<th>:</th>
											<td><%=f.getDescription()%></td>
										</tr>
										<tr>
											<th scope="row">Actors</th>
											<th>:</th>
											<td>
												<%
												List<FilmActor> list = dao.getActorId(f.getFilmId());
												for (FilmActor acid : list) {

												    Actor ac = dao.getActorName(acid.getActorId());
												    out.print(ac.getFirstName() + " " + ac.getLastName() + " , ");
												}
												%>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>