<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
  <style>
    h3 {
        color:bisque;
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
      margin-left: 20px;
      margin-right: 20px;
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

    table {
      border-collapse: collapse;
      margin-left: auto;
      margin-right: auto;
      font-family: Gill Sans MT, sans-serif;
    }
    th, td {
      border: 2px solid olive;
      padding: 8px;
      text-align: left;
      background-color:white;
    }
    th {
      background-color: bisque;
    }
  </style>


<body style="background-color:DarkOliveGreen;">
  <h1 style="color:darkkhaki; font-family:impact; text-align: center;">
    Welcome to the Fall 2024 Project 4 Enterprise System
  </h1>
  <h2 style="color:darkkhaki; font-family:arial black; text-align: center;">
    A Servlet/JSP-based Multi-tiered Enterprise Application Using a Tomcat Container
  </h2>

  <hr style = "height: 3px; border:none; background-color:darkkhaki;">
  <h3>
    You are connected to the Project 4 Enterprise System database as a ROOT-LEVEL user
    <br>
    Please enter any SQL query or update command in the box below
  </h3>
  <div class="form-container">
    <form action="rootServlet" method="post">
        <textarea id="query" name="query" rows="10" cols="60" required></textarea>
        <br>
        <button type="submit"><b>Execute Command</b></button>
        <button type ="submit" style="color:darkslateblue"><b>Reset Form</b></button>
        <button type="submit" style="color:firebrick"><b>Clear Results</b></button>
      </form>
  </div>


  <h3>
    All execution results will appear below this line
  </h3>
  <hr style = "height: 3px; border:none; background-color:darkkhaki;">

  <h2 style="color:bisque; text-align: center; font-family: Gill Sans MT, sans-serif;">
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