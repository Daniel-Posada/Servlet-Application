<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>   
<!DOCTYPE html>
<html>
  <style>
    h3 {
        color:pink;
        text-align: center;
        font-family: Gill Sans MT, sans-serif;
        margin: top 30px;
        margin-bottom: 30px;
    }
    button {
      background-color: bisque;
      color: darkolivegreen;
      border: none;
      padding: 10px;
      text-align: center;
      font-size: 20px;
      border-radius: 5px;
      cursor: pointer;

      margin-top:30px;
      margin-left: 80px;
      margin-right: 80px;
      margin-bottom: 10px;
    }
    textarea {
        border:none;
        border-radius: 3px;
        font-size:15pt;
    }
    .form-container {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .pick {
      color:pink;
      text-align: center;
      font-size: 20pt;
      font-family: Gill Sans MT, sans-serif;
      padding-bottom: 30px;
    }

    table {
      border-collapse: collapse;
      margin-left: auto;
      margin-right: auto;
      font-family: Gill Sans MT, sans-serif;
    }
    th, td {
      border: 2px solid darkseagreen;
      padding: 8px;
      text-align: left;
      background-color:white;
    }
    th {
      background-color: pink;
    }
  </style>


<body style="background-color:DarkOliveGreen;">
  <h1 style="color:lightcoral; font-family:impact; text-align: center;">
    Welcome to the Fall 2024 Project 4 Enterprise System
  </h1>
  <h2 style="color:lightcoral; font-family:arial black; text-align: center;">
    A Servlet/JSP-based Multi-tiered Enterprise Application Using a Tomcat Container
  </h2>

  <hr style = "height: 3px; border:none; background-color:pink;">
  <h3>
    You are connected to the Project 4 Enterprise System database as a ACCOUNTANT-LEVEL user
    <br>
    Please select the operation you would like to perform from the list below
  </h3>

  <div class="form-container">
    <form action="accountantServlet" method="post">
      <input type="radio"  name="command" id="status" value="status" style="margin-bottom:15px">
      <label class="pick" for="status">Get the Maximum Status Value of All Suppliers </label> <label class="pick" style="color: yellowgreen">(Returns a maximum value)</label><br>
      
      <input type="radio" name="command" id="weight" value="weight" style="margin-bottom:15px">
      <label class="pick" for="weight">Get the Total Weight of All Parts</label> <label class="pick" style="color: yellowgreen">(Returns a sum)</label><br>
      
      <input type="radio" name="command" id="shipments" value="shipments" style="margin-bottom:15px">
      <label class="pick" for="shipments">Get the Total Number of Shipments </label> <label class="pick" style="color: yellowgreen">(Returns the current number of shipments total)</label><br>
      
      <input type="radio" name="command" id="workers" value="workers" style="margin-bottom:15px">
      <label class="pick" for="workers">Get the Name and Number of Workers of the Job with the Most Workers </label> <label class="pick" style="color: yellowgreen">(Returns two values)</label><br>
      
      <input type="radio" name="command" id="supplier" value="supplier" style="margin-bottom:15px">
      <label class="pick" for="supplier">List the Name and Status of Every Supplier </label> <label class="pick" style="color: yellowgreen">(Returns a list of supplier names with status)</label>
    
      <button><b>Execute Command</b></button>
      <button style="color:firebrick"><b>Clear Results</b></button>
    </form>
  </div>

  <h3>
    All execution results will appear below this line
  </h3>

  <hr style = "height: 3px; border:none; background-color:pink;">

  <h2 style="color:pink; text-align: center; font-family: Gill Sans MT, sans-serif;">
    Execution Results
  </h2>

  <%-- Display error message if any --%>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    
    <table>
      <tr><td style="color:firebrick;">
        <b>Error executing the SQL Statement</b>
        <br>
        <%= error %>
      </td></tr>
    </table>
    <% } %>

    <%-- Display the table if results exist --%>
    <%
        List<String> columnNames = (List<String>) request.getAttribute("columnNames");
        List<List<String>> rows = (List<List<String>>) request.getAttribute("rows");
        if (columnNames != null && rows != null) {
    %>
    <table>
        <tr>
            <% for (String columnName : columnNames) { %>
            <th><%= columnName %></th>
            <% } %>
        </tr>
        <% for (List<String> row : rows) { %>
        <tr>
            <% for (String cell : row) { %>
            <td><%= cell %></td>
            <% } %>
        </tr>
        <% } %>
    </table>
    <% } %>
</body>
</html>