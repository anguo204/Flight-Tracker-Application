<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Login Checker</title>
</head>
<html>
<body>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.servletContext.contextPath}/jsp/homeCustomerrep.jsp">Flight Tracker</a>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.servletContext.contextPath}/profileCustomerRep"><span class="glyphicon glyphicon-user"></span>
							Customer Representative Account </a></li>
					<li><a href='${pageContext.servletContext.contextPath}/logout'><span
							class="glyphicon glyphicon-log-in"></span> Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>
<h1>Update Aircraft Information:</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Aircraft ID</th>
      <th scope="col">Airline ID</th>
      <th scope="col">Total Economy Seats</th>
      <th scope="col">Total First Class Seats</th>
      <th scope="col">Total Business Class Seats</th>
    </tr>
  </thead>
  <tbody>
    <%  
    try{
    Class.forName("com.mysql.jdbc.Driver"); 
    System.out.println("driver found");
    } catch (ClassNotFoundException e){
    	System.out.println("No driver found");
    	e.printStackTrace();
    	return;
    }
 %>
 <%    
    String url  = "jdbc:mysql://cs336db.c0d2khgtglaj.us-east-2.rds.amazonaws.com:3306/travel";
    try{
    Connection con = DriverManager.getConnection(url, "cs336", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM Aircraft WHERE aircraft_id");
    
    while (rs.next()) {
    %>
    <tr>
		<td><%=rs.getString("aircraft_id") %></td>
		<td><%=rs.getString("airline_id") %></td>
		<td><%=rs.getString("total_seats_economy") %></td>
		<td><%=rs.getString("total_seats_first") %></td>
		<td><%=rs.getString("total_seats_business") %></td>
	</tr>
<% 
    }
    con.close();
    }catch (SQLException e){
    	System.out.println("connection failed");
    	e.printStackTrace();
    }
%>
  </tbody>
</table>
<%@ page import ="java.sql.*" %>
<div>
<a href='AddAircraft.jsp'>Add Aircraft</a>
</div>
<div>
<a href='DeleteAircraft.jsp'>Delete Aircraft</a>
</div>

<div>
<a href='CRUpdateAircraft.jsp'>Update Aircraft</a>
</div>

