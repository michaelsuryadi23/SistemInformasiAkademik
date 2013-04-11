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

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">Edit Badan Hukum</h2>
                <p>Pilih Badan Hukum :</p>
                <form action="../../EditBadanHukumServlet" method="get">
                <select name="badanHukum" style="width: 200px;">
                <%
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    List<University> listUniversities = sess.createQuery("from University").list();
                    for(University o : listUniversities){
                    %>
                    <option value="<%= o.getUnivId() %>"><%= o.getUnivName() %></option>
                    <%
                    }
                        %>
                </select><br/><br/>
                <input type="submit" value="Edit" style="width: 75px;"/>
                </form>
                
            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>
