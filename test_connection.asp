<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="db_connection.asp" -->

<%
On Error Resume Next

' Connect to database using GetConnection function from db_connection.asp
Dim conn, rs, sql
Set conn = GetConnection()
If Err.Number <> 0 Then
    Response.Write("Database connection error: " & Err.Description)
    Response.End
End If

' SQL query to retrieve data
sql = "SELECT TOP 1 * FROM TestTable"

' Execute SQL query
Set rs = conn.Execute(sql)
If Err.Number <> 0 Then
    Response.Write("SQL query error: " & Err.Description)
    Response.End
End If

' Check if there are results
If Not rs.EOF Then
    Response.Write("Connection successful and data retrieved: <br>")
    Response.Write("ID: " & rs("ID") & "<br>")
    Response.Write("TestColumn: " & rs("TestColumn") & "<br>")
Else
    Response.Write("Connection successful but no data found.")
End If

' Clean up
rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing

On Error GoTo 0
%>
