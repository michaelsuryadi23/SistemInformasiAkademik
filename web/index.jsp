<%-- 
    Document   : index
    Created on : 08 Apr 13, 13:44:40
    Author     : Michael
--%>

<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Staff"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Login - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="resources/style/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="resources/style/index.css">
    </head>

    <body>
        <jsp:include page="content/header.jsp"/>
        <div id="content">
            <div id="content-left">
            </div>

            <div id="content-mid">
                <div id="content-mid-center" style="text-align: center; width: 300px; height: 300px; margin: auto; margin-top: 50px;">
                    <h2 style="text-align: center; margin-left: 20px;">Login to System</h2>
                    <fieldset>
                        <form name='f' action="LoginServlet?loginattempt=1" method='POST'>
                            <table style="text-align: center; width: 320px;">
                                <tr>
                                    <td><label for="username">Username : </label></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="j_username" style="text-align: center; height: 30px;"></td>
                                </tr>
                                <tr>
                                    <td><label for="username">Password : </label></td>
                                </tr>
                                <tr>
                                    <td><input type="password" name="j_password" style="height: 30px; text-align: center;"></td>
                                </tr>
                                <tr>
                                    <td><input type="submit" value="Sign In" style="width: 100px;"/></td>
                                </tr>
                            </table>
                        </form>
                    </fieldset>
                </div>

            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
