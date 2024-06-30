<%
Dim connString
connString = "Provider=SQLOLEDB;Data Source=DESKTOP-ALQ1PH1\SQLEXPRESS01;Initial Catalog=CoffeeShop;Integrated Security=SSPI;"

Function GetConnection()
    Dim conn
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open connString
    Set GetConnection = conn
End Function
%>
