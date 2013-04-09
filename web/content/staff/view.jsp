<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Staff"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="com.rpll.util.HibernateUtil"%>
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
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">View Data Staff</h2>
                <table style="margin-left: 70px; width: 500px;" border="1">
                    <thead style="background-color: black; color: white;border: 1px dotted black">
                        <th>NIK</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>Telp</th>
                        <th>Opsi</th>
                    </thead>
                <%
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    List<Staff> listStaff = sess.createQuery("from Staff").list();
                    
                    for(Staff o :listStaff){
                %>
                <tr>
                    <td><%= o.getStaffId()%></td>
                    <td><%= o.getStaffName() %></td>
                    <td><%= o.getStaffAddress() %></td>
                    <td><%= o.getStaffTelp() %></td>
                    <td><a href="findstaff.jsp?nik=<%= o.getStaffId() %>">Pilih</a></td>
                </tr>
                <%
                    }
                %>
                </table>
            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>
