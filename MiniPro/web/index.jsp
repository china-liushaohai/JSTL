<%-- 
    Document   : index
    Created on : Sep 10, 2012, 9:41:55 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="ico/iit.gif">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



    <div class="gradient">
        <h1><span>Welcome to Java EE 6 Technology Comments</span></h1>
    </div>

    <body>
        <form action="LoginServlet" method="post">
            <table align="center" style="border:0px solid #000000;">
                <tr><td colspan=2>&nbsp;</td></tr>
                <tr>
                    <td><b>Login Name</b></td>
                    <td><input type="text" name="userName" placeholder="Username" autofocus required></td>
                </tr>
                <tr>
                    <td><b>Password</b></td>
                    <td><input type="password" name="password" pattern="[a-z0-9]{8}" placeholder="*****"></td>
                </tr>
                <tr>
                    <td><a style="color: white" href="signup.jsp">>>Sign Up</a></td>
                    <td><a style="color: white" href="recover.jsp">>>Forgot Password?</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="Submit" value="Submit"></td>
                </tr>
                <tr><td colspan=2>&nbsp;</td></tr>
            </table>
            <%  String msg = request.getParameter("msg");
                if (msg != null) {
            %>
            <label><center><font color="red" size="2"><%=msg%></font></center></label> 
             <% } %>  

        </form>
    </body>
</html>



