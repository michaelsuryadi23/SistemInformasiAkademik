<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Students"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Utilitas - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
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
        <jsp:include page="privilage.jsp"/>

        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <h2 style="text-align: center; margin-left: 20px;">Ganti Password</h2>
            <%
                if (!session.getAttribute("jabatan").toString().equals(" ") && session.getAttribute("jabatan") != null) {
                int nim = Integer.parseInt(session.getAttribute("username").toString());
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<Students> student = sess.createQuery("From Students where studentId="+nim).list();
                Students stu = student.get(0);
                %>
                
                        <%
            if(request.getParameter("stat")!=null){
                if(request.getParameter("stat").equals("1")){
                    out.print("<div style='margin-bottom:10px; text-align:center; background-color:yellow;'>Penggantian password berhasil</div>");
                }
                else {
                    out.print("<div style='margin-bottom:10px;text-align:center; background-color:red;'>Penggantian password gagal</div>");
                }
            }
            %>
                <form action="../../PassServlet" method="get" style="margin-left: 350px;">
            <table>
                <tr>
                    <td>NIM : </td>
                    <td><input type="text" readonly="readonly" name="nim" value="<%= stu.getStudentId() %>"/></td>
                </tr>
                <tr>
                    <td>Nama : </td>
                    <td><input type="text" readonly="readonly" name="nama" value="<%= stu.getStudentName() %>"/></td>
                </tr>
                <tr>
                    <td>Pass Lama : </td>
                    <td><input type="password" name="passLama" /></td>
                </tr>
                <tr>
                    <td>Pass Baru : </td>
                    <td><input type="password" name="passBaru" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Simpan" style="width: 100px; height: 30px;" /></td>
                </tr>
            </table>
            </form>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>
        <%
                }
                    %>
    </body>
</html>
