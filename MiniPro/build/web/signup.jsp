<%-- 
    Document   : signup
    Created on : Sep 17, 2012, 1:48:02 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ck" uri="/WEB-INF/tlds/Checkid.tld"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>



    <sql:setDataSource var="itm515DS" dataSource="jdbc/itm515DS" />
    <%@ include file="navigate.jspf" %>
    <body>
        <h1>New Registration</h1>
        <font color="blue">

        </font>
        <form method="post">
            <table width="500px">
                <tr><td colspan=2>&nbsp;</td></tr>
                <tr>
                    <td><b>Choose UserID</b></td>
                    <td><input type="email" name="userName" placeholder="Username" autofocus ></td>
                    <td>  
                        <font color="red">
                        <c:if test="${param.userName == false}">
                            <c:out value="This field can not be null"/>s
                        </c:if>
                        
                        </font>
                    </td>
                </tr>
                <tr>
                    <td><b>First Name</b></td>
                    <td><input type="text" name="FName" autofocus ></td>
                    <td>  
                        <font color="red">
                        <c:if test="${param.LName == false}">
                            <c:out value="This field can not be null"/>s
                        </c:if>
                        
                        </font>
                    </td>
                </tr>
                <tr>
                    <td><b>Last Name</b></td>
                    <td><input type="text" name="LName" autofocus ></td>
                    <td>  
                        <font color="red">
                        <c:if test="${param.FName == false}">
                            <c:out value="This field can not be null"/>s
                        </c:if>
                        
                        </font>
                    </td>
                </tr>

                <tr>  <td><b>Choose Password</b></td>
                    <td><input type="password" required name="pwd1" pattern="[a-z0-9]{8}">
                    </td><td></td>             
                </tr>
                <tr>
                    <td><b>Re-Enter Password</b></td>
                    <td>
                        <input type="password" required name="pwd2" pattern="[a-z0-9]{8}">
                    </td>
                    <td>  
                        <font color="red">  
                        <c:if test="${param.pwd1 != param.pwd2}">
                            <c:out value="Password Mismatch"/>
                        </c:if>

                        </font>

                    </td>
                </tr>
                <tr>
                    <td><b>Address</b></td>
                    <td><input type="text" name="addr">(Optional)</td>
                </tr>
                <tr>
                    <td><b>1. Date of birth</b></td>
                    <td><input type="text" name="dob" placeholder="MM/DD/YYYY"></td>
                    <td><font color="red"><c:if test="${param.dob == false}">
                            <c:out value="Please fill you birth date"/>
                        </c:if></font>
                    </td>
                </tr>
                <tr>
                    <td><b>2. Birth City</b></td>
                    <td><input type="text" name="bCity" placeholder="Chicago,IL"></td>
                    <td><font color="red">
                        <c:if test="${param.bCity == false}">
                            <c:out value="Please fill you birth City"/>
                        </c:if></font>
                    </td>
                </tr>
                <tr>
                    <td><b>3. Maid's name</b></td>
                    <td><input type="text" name="mName" ></td>
                    <td><c:if test="${param.mName == false}">
                            <font color="red"> <c:out value="Please fill you Maid's name"/></font>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Submit"></td>
                    <td></td>  
                </tr>
                <tr><td colspan=2>&nbsp;</td></tr>
            </table>
        </form>

        <c:if test="${pageContext.request.method=='POST'}">
            <sql:update var="signUp" dataSource="${itm515DS}" >
                INSERT INTO LOGIN.LISTUSER VALUES (?,?,?,?,?,?,?,?) 
                <sql:param value="${param.userName}" />
                <sql:param value="${param.pwd1}" />
                <sql:param value="${param.FName}" />
                <sql:param value="${param.LName}" />
                <sql:param value="${param.addr}" />
                <sql:param value="${param.dob}" />
                <sql:param value="${param.bCity}" />
                <sql:param value="${param.mName}" />
            </sql:update>
            <c:if test="${signUp>=1}">
                <font size="3" color='green'> Congratulations ! Signed up successfully.</font>
                <%  response.sendRedirect("success_1.jsp");%>
            </c:if>

        </c:if>
    </body>
</html>
