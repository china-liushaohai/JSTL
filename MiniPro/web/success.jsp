<%-- 
    Document   : success
    Created on : Sep 17, 2012, 1:24:07 PM
    Author     : Admin
--%>

<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="windows-1256"
         import="src.UserBean"
         %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%@ include file="navigate.jspf" %>
    
    <body>
        <%  if (session.getAttribute("currentUser") != null) {
                UserBean ub = (UserBean) (session.getAttribute("currentUser"));
        %> Welcome back <%= ub.getUsername()%> 
        <h1><center>Login Successful !!</center></h1>
        <p>Click on Comment in order to Add/View</p>

        <% } else {%> 
        Session Invalidated 
        <% }%>

    </body>
</html>
