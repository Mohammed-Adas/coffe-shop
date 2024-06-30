<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="db_connection.asp" -->
<%
On Error Resume Next

' Retrieve form data
Dim username, password, name, address, city, postalCode, country, state
username = Request.Form("username")
password = Request.Form("password")
name = Request.Form("name")
address = Request.Form("address")
city = Request.Form("city")
postalCode = Request.Form("postalCode")
country = Request.Form("country")
state = Request.Form("state")

' Connect to database using GetConnection function from db_connection.asp
Dim conn, cmd, sql, userID, rs
Set conn = GetConnection()
If Err.Number <> 0 Then
    Response.Write("Database connection error: " & Err.Description)
    Response.End
End If

' Insert into Users table
sql = "INSERT INTO Users (Username, Password) VALUES (?, ?)"
Set cmd = Server.CreateObject("ADODB.Command")
With cmd
    .ActiveConnection = conn
    .CommandType = 1 ' adCmdText
    .CommandText = sql
    .Parameters.Append .CreateParameter("@Username", 200, 1, 100, username) ' adVarChar
    .Parameters.Append .CreateParameter("@Password", 200, 1, 100, password) ' adVarChar
    .Execute
End With
If Err.Number <> 0 Then
    Response.Write("Insert Users error: " & Err.Description)
    Response.End
End If

' Retrieve UserID
Set rs = conn.Execute("SELECT @@IDENTITY AS UserID")
If Err.Number <> 0 Then
    Response.Write("Retrieve UserID error: " & Err.Description)
    Response.End
End If
userID = rs("UserID")
rs.Close

' Insert into ShippingInfo table
sql = "INSERT INTO ShippingInfo (UserID, Name, Address, City, PostalCode, Country, State) VALUES (?, ?, ?, ?, ?, ?, ?)"
Set cmd = Server.CreateObject("ADODB.Command")
With cmd
    .ActiveConnection = conn
    .CommandType = 1 ' adCmdText
    .CommandText = sql
    .Parameters.Append .CreateParameter("@UserID", 3, 1, , userID) ' adInteger
    .Parameters.Append .CreateParameter("@Name", 200, 1, 200, name) ' adVarChar
    .Parameters.Append .CreateParameter("@Address", 200, 1, 510, address) ' adVarChar
    .Parameters.Append .CreateParameter("@City", 200, 1, 200, city) ' adVarChar
    .Parameters.Append .CreateParameter("@PostalCode", 200, 1, 40, postalCode) ' adVarChar
    .Parameters.Append .CreateParameter("@Country", 200, 1, 200, country) ' adVarChar
    .Parameters.Append .CreateParameter("@State", 200, 1, 200, state) ' adVarChar
    .Execute
End With
If Err.Number <> 0 Then
    Response.Write("Insert ShippingInfo error: " & Err.Description)
    Response.End
End If

' Clean up
conn.Close
Set conn = Nothing
Set cmd = Nothing

' Response to client
Response.Write("Order confirmed! Your order ID is: " & userID)

On Error GoTo 0
%>
