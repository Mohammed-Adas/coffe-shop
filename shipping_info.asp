<!--#include file="db_connection.asp" -->

<%
Dim userID, address, city, postalCode, country

If Session("UserID") = "" Then
    Response.Write("Please login first.")
    Response.End
End If

userID = Session("UserID")
address = Request.Form("address")
city = Request.Form("city")
postalCode = Request.Form("postalCode")
country = Request.Form("country")

Dim conn, sql
Set conn = GetConnection()

sql = "INSERT INTO ShippingInfo (UserID, Address, City, PostalCode, Country) VALUES (" & userID & ", '" & address & "', '" & city & "', '" & postalCode & "', '" & country & "')"
conn.Execute(sql)

conn.Close
Set conn = Nothing

Response.Redirect("confirmation.html")
%>

<form method="post" action="shipping_info.asp">
    <label for="address">Address:</label>
    <input type="text" name="address" id="address" required>
    <br>
    <label for="city">City:</label>
    <input type="text" name="city" id="city" required>
    <br>
    <label for="postalCode">Postal Code:</label>
    <input type="text" name="postalCode" id="postalCode" required>
    <br>
    <label for="country">Country:</label>
    <input type="text" name="country" id="country" required>
    <br>
    <input type="submit" value="Submit">
</form>
