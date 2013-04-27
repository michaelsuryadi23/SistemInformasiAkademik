<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="java.util.List"%>
<%@page import="com.rpll.model.MatkulDept"%>
<%@page import="com.rpll.model.TakeMatkulPeriod"%>
<%@page import="com.rpll.model.StudentAngkatan"%>
<%@page import="com.rpll.model.Students"%>
<%@page import="com.rpll.model.Periods"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Kartu Rencana Studi - Sistem Informasi Akademik</title>
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
        <%
            Session sess = HibernateUtil.getSessionFactory().openSession();
            Periods period = (Periods) sess.createQuery("from Periods where status=1").list().get(0);
            Students student = (Students) sess.createQuery("from Students where studentId=" + session.getAttribute("username")).list().get(0);
            StudentAngkatan stu = (StudentAngkatan) sess.createQuery("from StudentAngkatan where id.studentId=" + student.getStudentId()).list().get(0);
            int totalSks = sess.createQuery("from TakeMatkulPeriod where id.studentId="+student.getStudentId()).list().size();
            List<MatkulDept> matkul = sess.createQuery("from MatkulDept where id.departmentId="+stu.getDepartment().getDepartmentId()).list();
            int i =0;
            List<TakeMatkulPeriod> takeMatkul = sess.createQuery("from TakeMatkulPeriod where id.studentId="+student.getStudentId()+" and id.periodId="+period.getPeriodYear()).list();
            
        %>

        <div id="content" style="height: 1200px;">
            <jsp:include page="../sidemenu.jsp" />
            <h2 style="text-align: center; margin-left: 20px;">Input KRS</h2>
            <div id="left" style="height: 100px; width: 500px; float: left;">
                <table style="text-align: left; margin-left: 60px;">
                    <tr>
                        <td>NIM : </td>
                        <td><%= student.getStudentId()%></td>
                    </tr>
                    <tr>
                        <td>Nama : </td>
                        <td><%= student.getStudentName()%></td>
                    </tr>
                    <tr>
                        <td>Jurusan : </td>
                        <td><%= stu.getDepartment().getDepartmentName()%></td>
                    </tr>
                </table>
            </div>
                    <div id="right" style="height: 100px; width: 500px; float: left;">
                <table style="text-align: left; margin-left: 60px;">
                    <tr>
                        <td>Total SKS yg sudah diambil : </td>
                        <td><%= totalSks %></td>
                    </tr>
                    <tr>
                        <td>IPK Saat Ini :</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Max Pengambilan Matakuliah : </td>
                        <td>20 SKS</td>
                    </tr>
                </table>
            </div>
            <h3 style="text-align: center; margin-left: 20px;">List Matakuliah</h3>
            <form action="../../KrsServlet" method="post">
            <table style="text-align: left; margin-left: 150px; width: 700px;">
                
                <thead style="background-color: black; color: white;">
                    <th>Matkul ID</th> 
                    <th>Nama Matkul</th> 
                    <th>Semester</th> 
                    <th>Bobot SKS</th> 
                    <th>Tipe MK</th> 
                    <th>Pilih</th>
                </thead>
                
                <%
                    for(MatkulDept o : matkul){
                        
                        %>
                        <tr>
                            <td><%= o.getMatkul().getMatkulId() %></td>
                            <td><%= o.getMatkul().getMatkulName() %></td>
                            <td><%= o.getMatkulSem() %></td>
                            <td><%= o.getBobotSks() %></td>
                            <td><%= o.getMatkulMandatory().getMandatoryName() %></td>
                            <td><input type="checkbox" name="cek<%= i %>"/></td>
                            <input type='hidden' name="idMatkul<%= i %>" value="<%= o.getMatkul().getMatkulId() %>" />
                        </tr>
                        <%
                        i++;
                    }
                    %>
                    <tr>
                    <input type='hidden' name='counter' value="<%= i %>"/>
                    <input type='hidden' name='deptId' value='<%= stu.getDepartment().getDepartmentId() %>'/>
                    <input type="hidden" name='period' value='<%= period.getPeriodYear() %>'/>
                    <input type='hidden' name='studentId' value='<%= stu.getStudents().getStudentId()%>'/>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Proses" style="width: 150px; height: 30px;"/></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
            </table>
            </form>
            <h3 style="text-align: center; margin-left: 20px; margin-top: 50px;">List Matakuliah yg sudah diambil</h3>
            <table style="margin-left: 150px; width: 700px;">
                <thead style="background-color: black; color: white;">
                    <th>Matkul ID</th> 
                    <th>Nama Matkul</th> 
                    <th>Semester</th> 
                    <th>Bobot SKS</th> 
                    <th>Status</th>
                    <th>Hapus</th>
                </thead>
                <%
                    for(TakeMatkulPeriod t : takeMatkul) {
                        MatkulDept m = (MatkulDept) sess.createQuery("from MatkulDept where id.matkulId="+t.getMatkul().getMatkulId()).list().get(0);
                        %>
                        <tr>
                            <td><%= t.getMatkul().getMatkulId() %></td>
                            <td><%= t.getMatkul().getMatkulName() %></td>
                            <td><%= m.getMatkulSem() %></td>
                            <td><%= m.getBobotSks() %></td>
                            <td>INVALID</td>
                            <input type='hidden' name='deptId' value='<%= stu.getDepartment().getDepartmentId() %>'/>
                            <input type="hidden" name='period' value='<%= period.getPeriodYear() %>'/>
                            <input type='hidden' name='studentId' value='<%= stu.getStudents().getStudentId()%>'/>
                            <td><a href='../../deleteKrsServlet?matkul=<%= t.getMatkul().getMatkulId() %>&period=<%= period.getPeriodYear() %>&studentId=<%= student.getStudentId() %>&deptId=<%= stu.getDepartment().getDepartmentId()%>'>Hapus</a></td>
                        </tr>
                        <%
                    }
                    %>
                    
            </table><br/>
                    <input type='submit' value="Self-Approve" style="text-align: left;"/>
                    
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
