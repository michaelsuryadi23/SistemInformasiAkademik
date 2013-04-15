<%-- 
    Document   : update
    Created on : Apr 15, 2013, 11:06:06 AM
    Author     : Acer
--%>

<%@page import="com.rpll.model.TakeMatkulPeriod"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home - Sistem Informasi Akademik</title>
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
        <jsp:include page="privilage.jsp"/>
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">Isi CEF</h2>
                <form action="../../CreateCEFServlet" method="GET">
                    <table style="margin-left: 180px;">
                        <tr>
                            <td>Matakuliah :</td>
                            <td>
                                <input type="text" disabled="true" name="nmatkul" value="<%= request.getParameter("nmatkul").toString()%>" />
                                <input type="hidden" name="matkul" value="<%= Integer.parseInt(request.getParameter("matkul").toString())%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Saran :
                            </td>
                            <td>
                                <%
                                    Session ses = HibernateUtil.getSessionFactory().openSession();
                                    int nim = Integer.parseInt(session.getAttribute("username").toString());
                                    List<TakeMatkulPeriod> listMatkul = ses.createQuery("from TakeMatkulPeriod where students.studentId=" + nim + " and matkul.matkulId=" + Integer.parseInt(request.getParameter("matkul").toString())).list();
                                %>
                                <textarea name="saran" style="width:200px; height: 200px;"><%= listMatkul.get(0).getMatkulCef() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Save"/></td>
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
