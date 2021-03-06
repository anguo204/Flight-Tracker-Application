<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="com.flighttracker.Airport"%> 
    
<!DOCTYPE html>
<html>
<head>
<title>Search Flights</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style>
form {
	text-align: center;
	
}

label {
	margin-right: 20px;
}
div span{
    position:absolute;
    right:10;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Flight Tracker</a>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.servletContext.contextPath}/profileCustomer"><span class="glyphicon glyphicon-user"></span>
							Account </a></li>
					<li><a href='logout.jsp'><span
							class="glyphicon glyphicon-log-in"></span> Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<form class="form-inline" action="${pageContext.servletContext.contextPath}/ViewFlights" method="POST">
		<h2>Search All Flights</h2>
		<%ArrayList<Airport> airports = (ArrayList<Airport>)request.getAttribute("airports"); %>
		
		<hr>
		
		<div class="form-group">
			<label for="sel1" id="someLabel">Departure Airport:
			<select class="form-control" name="departAirport">
				<% for(Airport a:airports) { %>
				<option><%= a.getAirportId() %></option>
				<% } %>
			</select>
			</label> 
		</div>

		<div class="form-group">
			<label for="sel1">Arrival Airport:
			<select class="form-control" name="arriveAirport">
				<% for(Airport a:airports) { %>
				<option><%= a.getAirportId() %></option>
				<% } %>
			</select>
			</label> 
		</div>

		<div class="form-group">
			<label class="input-group-text">Departure Date 
			<input type="text" class="form-control" name="departDate" placeholder="mm/dd/yyyy">
			</label>
		</div>


		<div class="form-group">
			<label class="input-group-text">Arrival Date
			<input type="text" class="form-control" name="arriveDate" placeholder="mm/dd/yyyy">
			</label> 
		</div>
		
		<input type='submit' class="btn btn-success" value="Search!" id="search"/>
	
	</form>
		
	<!-- Have to dynamically display flights -->
	<!-- <div class="list-group" style="width: 75%;" >
		<h2>Flights Found!</h2>
		<a href="#"
			class="list-group-item list-group-item-action">
			<div>
				<h5>Departure Time - Arrival Time</h5>
			</div>
			<p>Airline</p> 
		</a>
		<a href="#"
			class="list-group-item list-group-item-action">
			<div>
				<h5>Departure Time - Arrival Time</h5>
			</div>
			<p>Airline</p> 
			
		</a>
		
	</div> -->


	<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%>  <%--this will display the username that is stored in the session. --%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>

</body>
</html>
