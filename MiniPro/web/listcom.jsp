<%-- 
    Document   : listcom
    Created on : Sep 23, 2012, 9:40:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <%@ include file="navigate.jspf" %>
    <sql:setDataSource var="itm515DS" dataSource="jdbc/itm515DS" />
    </head>
    <body>
        <sql:query dataSource="${itm515DS}" var="result">
                SELECT * from login.comments 
            </sql:query>
            <bold><c:out value="Listing the comments"/></bold>
            <table>
                <tr>
                    <th>User id</th>
                    <th>Nick Name</th>
                    <th>Comment</th>
                    <th>date</th>
                </tr>
                <c:out value="${row.comment_dt}"/>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.user_id}"/></td>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.comment}"/></td>
                        <td><c:out value="${row.comment_dt}"/></td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
