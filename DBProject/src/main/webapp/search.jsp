<%@page import="controller.Film"%>
<%@page import="java.util.List"%>

<%@page import="DAO.DBConnect"%>
<%@page import="controller.FilmDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/fontawesome.css"
      integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7"
      crossorigin="anonymous"
    />
<link href="css/new.css" rel="stylesheet"/>

<style>
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


.header-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}

.header-title {
  font-size: 28px;
  font-weight: 600;
}

.search-section {
  position: relative;
}

.search-input {
  
  padding: 8px 16px;
  border-radius: 8px;
  padding-left: 34px;
}

.search-icon-svg {
  width: 20px;
  position: absolute;
  top: 50%;
  left: 10px;
  transform: translateY(-50%);
}

.search-icon-svg {
  width: 20px;
  position: absolute;
  top: 50%;
  left: 10px;
  transform: translateY(-50%);
}


.p-relative {
  position: relative;
}

.search-restaurant {

      width: 100%;
    border-radius: 8px;
    outline: none;
    border: 1px solid black;
    padding: 8px 16px;
    padding-right: 48px;
    padding-left: 34px;
}
.search-movies-container {
margin-bottom: 2rem}
.main-container {
padding: 2rem;}


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
	     
      <div class="main-container">
      <div class="search-movies-container p-relative">
      <form action="search.jsp" method="post">
          <input
            type="text"
            name="ch"
            class="search-restaurant"
            placeholder="Search movies"
          />
            </form>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="search-icon-svg search-restaurant-svg"
            viewBox="0 0 512 512"
          >
            <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
            <path
              d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"
            />
          </svg>
        
         
        </div>
        


	<div class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<%
				String ch = request.getParameter("ch");
				FilmDAO dao = new FilmDAO(DBConnect.getConnection());
				List<Film> list = dao.getFilmBySearch(ch);
				%>
				
				<p class="fs-4">
					Search Results for
					<%=ch%></p>
					
				<div class="card paint-card">
					<div class="card-body">

				<div class="popular-card">
				<%
								for (Film f : list) {

								%>
      <a href="movie_details.jsp?id=<%=f.getFilmId()%>">
          <img
            src="https://gijtr.org/wp-content/uploads/2022/01/Camila-Rosa_Break-The-Silence_English_Hi-Res-Credits-768x1024.jpg"
            alt="image failed to load"
            class="popular-product-img"
          /></a>
          <div class="popular-product-description">
            <div class="product-title"><%=f.getTitle() %></div>
            <div class="product-description"><%=f.getRating() %></div>
          </div>
          <%} %>
			</div>
		</div>
	</div>

</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>