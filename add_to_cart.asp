<!--#include file="db_connection.asp" -->

<%
If Session("UserID") = "" Then
    Response.Redirect("login.asp")
End If

If Request.Form("submit") <> "" Then
    Dim userID, productID, quantity
    userID = Session("UserID")
    productID = Request.Form("productID")
    quantity = Request.Form("quantity")

    Dim conn, sql
    Set conn = GetConnection()

    sql = "INSERT INTO CartItems (UserID, ProductID, Quantity) VALUES (?, ?, ?)"
    Set cmd = Server.CreateObject("ADODB.Command")
    Set cmd.ActiveConnection = conn
    cmd.CommandText = sql
    cmd.CommandType = adCmdText
    cmd.Parameters.Append cmd.CreateParameter("@UserID", adInteger, adParamInput, , userID)
    cmd.Parameters.Append cmd.CreateParameter("@ProductID", adInteger, adParamInput, , productID)
    cmd.Parameters.Append cmd.CreateParameter("@Quantity", adInteger, adParamInput, , quantity)

    cmd.Execute

    conn.Close
    Set conn = Nothing

    Response.Redirect("cart.asp")
End If
%>

<form method="post" action="add_to_cart.asp">
    <label for="productID">Product ID:</label>
    <input type="text" name="productID" id="productID" required>
    <br>
    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" id="quantity" required>
    <br>
    <input type="submit" name="submit" value="Add to Cart">
</form>
