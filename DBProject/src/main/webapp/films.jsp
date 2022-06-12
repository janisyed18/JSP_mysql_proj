<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="controller.Film"%>
<%@page import="java.util.List"%>

<%@page import="DAO.DBConnect"%>
<%@page import="controller.FilmDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/new.css" rel="stylesheet"/>
</head>
<body>
<div class="card paint-card">
					<div class="card-body">

				<div class="popular-card">
				<%
				FilmDAO dao = new FilmDAO(DBConnect.getConnection());
				String name =null;
				List<Film> list = dao.getFilms(name);
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
