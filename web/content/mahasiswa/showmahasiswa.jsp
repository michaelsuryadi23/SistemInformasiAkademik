<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Students"%>
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
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">List Mahasiswa</h2>
                <table style="margin-left: 70px; width: 500px;" border="1">
                    <thead style="background-color: black; color: white;border: 1px dotted black">
                        <th>NIM</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>Telp</th>
                        <th>Opsi</th>
                    </thead>
                <%
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    List<Students> listStudents = sess.createQuery("from Students").list();
                    
                    for(Students o :listStudents){
                %>
                <tr>
                    <td><%= o.getStudentId() %></td>
                    <td><%= o.getStudentName() %></td>
                    <td><%= o.getStudentAddress() %></td>
                    <td><%= o.getStudentTelp() %></td>
                    <td><a href="editmahasiswa.jsp?nim=<%= o.getStudentId() %>">Pilih</a></td>
                </tr>
                <%
                    }
                %>
                </table>
            </div>

            <div id="content-right">

            </div>
        </div>

<jsp:include page="../footer.jsp"/>

    </body>
</html>
