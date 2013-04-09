<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Students"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Mahasiswa - Sistem Informasi Akademik</title>
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
                <h2 style="text-align: center; margin-left: 20px;">Update Data Mahasiswa</h2>
                <%
                    int nim = Integer.parseInt(request.getParameter("nim"));
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    List<Students> listStudents = sess.createQuery("from Students where studentId=" + nim).list();
                    Students student = listStudents.get(0);
                %>
                <table style="margin-left: 200px;">
                    <tr>
                        <td>NIM : </td>
                        <td><input type="text" readonly="readonly" name="nim" value="<%= student.getStudentId()%>"/></td>
                    </tr>
                    <tr>
                        <td>Nama : </td>
                        <td><input type="text" name="nama" value="<%= student.getStudentName()%>"/></td>
                    </tr>
                    <tr>
                        <td>Alamat : </td>
                        <td><input type="text" name="alamat" value="<%= student.getStudentAddress()%>"/></td>
                    </tr>
                    <tr>
                        <td>Telp : </td>
                        <td><input type="text" name="telp" value="<%= student.getStudentTelp()%>"/></td>
                    </tr>
                    <tr>
                        <td>Email : </td>
                        <td><input type="text" name="telp" value="<%= student.getStudentEmail()%>"/></td>
                    </tr>
                    <input type="hidden" name="dosenwali" value="<%= student.getLectures().getLectureId() %>"/>
                    <tr>
                        <td>Status : </td>
                        <td><select name="status" style="width: 150px;">
                                <option value="1" <% if(student.getStudentStatus()==1){out.print("selected='selected'");}%>>Aktif</option>
                                <option value="2" <% if(student.getStudentStatus()==2){out.print("selected='selected'");}%>>Cuti</option>
                                <option value="3" <% if(student.getStudentStatus()==3){out.print("selected='selected'");}%>>Alumni</option>
                            </select></td>
                    </tr>
                    <br/>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Save" style="width: 150px;"/></td>
                    </tr>
                </table>
            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>
