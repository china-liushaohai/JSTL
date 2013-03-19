<%-- 
    Document   : recover
    Created on : Sep 23, 2012, 1:43:50 AM
    Author     : Admin
--%>
<%@ include file="navigate.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      </head>
    <body>
        <form action="ValidateQ" method="post">
            <table align="center" width="500px"" >
                <c:set var="rdValue" value="<%=(int) (Math.random() * 3)%>" />
                <center> Refresh to generate some other question </center>
                <c:if test="${rdValue eq 0}">
                    <tr>
                        <td><b>Enter your Date of Birth :</b></td>
                        <td><input type="date" name="dob" id="dob"></td>
                        
                        </tr>    
            </c:if>
            <c:if test="${rdValue eq 1}">
                <tr>
                    <td><b>Enter your City of Birth :</b></td>
                    <td><input type="text" name="bCity" value="Chicago,IL" required placeholder="Chicago,IL"></td>
                </tr>    
            </c:if>
            <c:if test="${rdValue eq 2}">
                <tr>
                    <td><b>Enter your maid's name :</b></td>
                    <td><input type="text" value="Javi" name="mName" required></td>
                </tr>    
            </c:if>

            <tr>
                <td></td>
                <td><input type="submit" value="Submit" name="submit"></td>
            </tr>   
            <%  String msg = request.getParameter("msg");
                if (msg != null) {
            %>
            <label><center><font color="red" size="2"><%=msg%></font></center></label> 
                    <%
                        }
                    %>  
    </form>
</table>
</body>
</html>
