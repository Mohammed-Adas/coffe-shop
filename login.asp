<!--#include file="db_connection.asp" -->

<%
Dim username, password
username = Request.Form("username")
password = Request.Form("password")

Dim conn, rs, sql
Set conn = GetConnection()

sql = "SELECT * FROM Users WHERE Username = '" & username & "' AND Password = '" & password & "'"
Set rs = conn.Execute(sql)

If Not rs.EOF Then
    Session("UserID") = rs("UserID")
    Response.Redirect("cart.html")
Else
    Response.Write("Invalid login.")
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>

<form method="post" action="login.asp">
    <label for="username">Username:</label>
    <input type="text" name="username" id="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" required>
    <br>
    <input type="submit" value="Login">
</form>
