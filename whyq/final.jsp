<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("token_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "whyq";
String userId = "root";
String password = "password";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">


<select id="lstFruits" multiple="multiple" align="center">
    <option value="1">Bhel</option>
    <option value="2">Pani Puri</option>
    <option value="3">Sandwich</option>
    <option value="4">Dosa</option>
    <option value="5">Cold Drink</option>
</select>
<input type="button" id="btnSelected" value="Get Selected" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('#lstFruits').multiselect({
            includeSelectAllOption: true
        });
    });
</script>

<h2 align="center"><font><strong>Tokens</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Icons</b></td>
<td><b>token_id</b></td>
<td><b>menu_item</b></td>
<td><b>token_state</b></td>
<td><b>token_quant</b></td>
<td><b>menu_id</b></td>
<td><b>Status</b>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM tokens";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
<td><img src="prags\one.jpg"></img></td>

<td><%=resultSet.getString("token_id") %></td>
<td><%=resultSet.getString("menu_item") %></td>
<td><%=resultSet.getString("token_state") %></td>
<td><%=resultSet.getString("token_quant") %></td>
<td><%=resultSet.getString("menu_id") %></td>
<td><input type="checkbox"></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<%
%>
</table>
</body>
</html>