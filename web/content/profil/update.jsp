<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.StudentAngkatan"%>
<%@page import="com.rpll.model.Students"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="com.rpll.model.University"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profil - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/profil.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/style.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/fixedMenu_style2.css"/>

        <script src="../../resources/js/jquery-1.7.2.min.js"></script>
        <script src="../../resources/js/jquery.fixedMenu.js"></script>
        <script>
            $('document').ready(function() {
                $('.menu').fixedMenu();
            });
        </script>
        <jsp:include page="privilage.jsp" />
    </head>

    <body>
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <h2 style="text-align: center; margin-left: 20px;">Edit Profil Mahasiswa</h2>
            <%
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<StudentAngkatan> student = sess.createQuery("From StudentAngkatan where id.studentId="+session.getAttribute("username")).list();
                StudentAngkatan studentData = student.get(0);
                
                %>
                
                <div id="content-stu-left">
                    <img src="../../resources/img/people.jpg" style="width: 300px; height: 200px;"/>
                    
                </div>
                <div id="content-stu-right" style="padding-top: 20px;">
                    <form action="../../ProfilServlet?mode=2" method="post">
                   <table>
                        <tr>
                            <td><b>Nama :</b></td>
                            <td><input type="text" name="nama" value="<%= studentData.getStudents().getStudentName() %>"/></td>
                        </tr>
                        <tr>
                            <td><b>Email : </b></td>
                            <td><input type="text" name="email" value="<%= studentData.getStudents().getStudentEmail() %>"/></td>
                        </tr>
                        <tr>
                            <td><b>Alamat : </b></td>
                            <td><input type="text" name="alamat" value="<%= studentData.getStudents().getStudentAddress() %>"/></td>
                        </tr>
                        <tr>
                            <td><b>Telp : </b></td>
                            <td><input type="text" name="telp" value="<%= studentData.getStudents().getStudentTelp() %>"/></td>
                        </tr>
                        <tr>
                            <td><b>Dept : </b></td>
                            <td><input type="text" disabled="disabled" name="nama" value="<%= studentData.getDepartment().getDepartmentName() %>"</td>
                        </tr>
                        <tr>
                            <td><b>Angkatan : </b></td>
                            <td><input type="text" disabled="disabled" name="nama" value="<%= studentData.getAngkatan().getAngkatanDesc() %>"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Simpan" style="width: 150px; height: 30px;"/></td>
                        </tr>
                    </table>
                    </form>
                           
                </div>
            
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style="color: white;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
