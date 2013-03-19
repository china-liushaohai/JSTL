

<%@page import="java.util.Date"%>
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="src.UserBean"
         %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%@ include file="navigate.jspf" %>
    <sql:setDataSource var="itm515DS" dataSource="jdbc/itm515DS" />
    <body>
        <h1>Share your comments !</h1>
        <%  if (session.getAttribute("currentUser") != null) {
                UserBean ub = (UserBean) (session.getAttribute("currentUser"));
        %> Welcome back <%= ub.getUsername()%> 
        <c:set var="Uname" value="<%= ub.getUsername()%>" />
        <h1>Login Successful !!</h1>
        <p>Click on Comment in order to Add/View</p>

        <% } else {
                response.sendRedirect("index.jsp");
            }
        %> 
        <form method="post">
            <table>
                <tbody>
                    <tr>
                        <td><input type="text" name="Name" value="" placeholder="Name" required autofocus/></td>
                    </tr>
                    <tr>
                        <td><textarea name="Comment" cols="45" rows="5"  required>
                            </textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="Submit" value="Submit"></td>
                    </tr>
                </tbody>
            </table>
        </form>
        
        <c:if test="${pageContext.request.method=='POST'}">
            <%Date date = new java.util.Date();
                pageContext.setAttribute("date", date);%>
            <c:set var="date1" value="${date}" />
            <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd" var="Cmt_dt" />
            <c:out value="${row.Cmt_dt}"/>
            <sql:update var="comment" dataSource="${itm515DS}" >
                INSERT INTO LOGIN.COMMENTS VALUES (?,?,?,?) 
                <sql:param value="${Uname}"/>
                <sql:param value="${param.Name}" />
                <sql:param value="${param.Comment}" />
                <sql:param value="${Cmt_dt}" />
            </sql:update>
                <br>
            <c:if test="${comment>=1}">
                <font size="2" color='green'><bold> Comment accepted successfully.
                    <a href="listcom.jsp">view</a></bold></font> 
            </c:if>            
        </c:if>
    </body>
</html>
