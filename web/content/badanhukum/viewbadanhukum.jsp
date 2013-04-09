<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="java.util.List"%>
<%@page import="com.rpll.model.University"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Badan Hukum - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/fixedMenu_style2.css"/>

        <script src="../../resources/js/jquery-1.7.2.min.js"></script>
        <script src="../../resources/js/jquery.fixedMenu.js"></script>
        <script>
            $('document').ready(function() {
                $('.menu').fixedMenu();
            });
        </script>
    </head>

    <body>
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>
            <%
                int badanHukum = Integer.parseInt(request.getParameter("id"));
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<University> listUniversity = sess.createQuery("from University where univId="+badanHukum).list();
                
                University univ = listUniversity.get(0);
            %>
            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">Edit Badan Hukum</h2>
                <form action="EditBadanHukumServlet" method="post">
                    <table style="margin-left: 150px;">
                        <tr>
                            <td>ID badan hukum :</td>
                            <td><input type="text" name="univId" value="<%= univ.getUnivId() %>"/></td>
                        </tr>
                        <tr>
                            <td>Nama Badan Hukum :</td>
                            <td><input type="text" name="univName" value="<%= univ.getUnivName() %>"/></td>
                        </tr>
                        <tr>
                            <td>Alamat : </td>
                            <td><input type="text" name="univAddress" value="<%= univ.getUnivAddress() %>"/></td>
                        </tr>
                        <tr>
                            <td>Telp : </td>
                            <td><input type="text" name="univTelp" value="<%= univ.getUnivTelp() %>"/></td>
                        </tr>
                        <tr>
                            <td>Homepage : </td>
                            <td><input type="text" name="univHomepage" value="<%= univ.getUnivHomepage() %>"/></td>
                        </tr>
                        <tr>
                            <td>Email :</td>
                            <td><input type="text" name="univEmail" value="<%= univ.getUnivEmail() %>"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Save" style="width: 150px;"/></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>
