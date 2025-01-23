# Servlet-Application
## Mock database manager for fictional shipyard
This is an application that uses tomcat servlets to create a website. It is supposed to emmulate a managment application for a fake shipyard's database. <br><br>

## Home Screen
You start on the Home screen where it asks you to log in. You have three options, The Root User, the Client User, and the Accountant User. Each one has a different UI and different database permissions. <br> <br>
<img src = "HomePage.png" width=600> <br> <br>
If you input a username or password that does not match any of the credentials, then it'll throw up and error and ask you to try again. <br> <br>
<img src = "Denied.png" width=600> <br><br>

## Root User
The page is laid out very simply, with a command input section, three buttons, and an Execution Results section. The textbox accepts commands in SQL, and will print a result table underneath in the Execution Results section. The three buttons, left to right are to execute the SQL command, clear the Execution Results section, and to clear the command textbox. <br><br>
The Root user has full access to the database and can input any commands they wish. <br><br>
<img src = "RootHome.png" width=600> <br><br>
If you input an invalid SQL command though, the Execution Results section will throw an error. <br><br>
<img src = "RootError.png" width=600> <br><br>

## Client User
This is the Client User screen. Although the layour is identical to the root user page, it's distinguished by the color of its text. Clients can interact with the database in the same way the root user can however they have less permissions than the user. Here we can see the client trying to input a command into the SQL command box that it is not allowed to execute and thus the Execution Results outputs an error. <br> <br>
<img src = "ClientError.png" width=600> <br><br>

## Accountant User
The Accountant page is the most different of the three, as it only gives the user to five pre-set commands. These would be, in the mock scenario, used by an accountant to quikcly and convieniently check on the status of certain database tables and values without having to input raw SQL commands. <br><br>
<img src = "Accountant.png" width=600> <br><br>

