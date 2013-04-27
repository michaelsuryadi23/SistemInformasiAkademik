<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Lectures"%>
<%@page import="com.rpll.model.TeachPeriod"%>
<%@page import="com.rpll.model.MatkulDept"%>
<%@page import="com.rpll.model.MatkulMandatory"%>
<%@page import="com.rpll.model.Matkul"%>
<%@page import="com.rpll.model.Department"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Marks"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Assign Dosen - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/kurikulum.css"/>
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
            <h2 style="text-align: center; margin-left: 20px;">Assign Dosen Matakuliah</h2>
            <div id="insertDiv">
                        
                        <%
                            int deptId = Integer.parseInt(request.getParameter("dept"));
                            Session sess = HibernateUtil.getSessionFactory().openSession();
                            List<Matkul> listMatkul = sess.createQuery("From Matkul").list();
                            List<Department> dept = sess.createQuery("From Department where departmentId="+deptId).list();
                        %>

            </div>
                        <h3 style="text-align: center; margin-left: 20px;">List Matkul Departement</h3>
                        
                        <table style="margin-left: 390px;">
                            <tr>
                                <td>Departement :</td>
                                <td><input type="text" disabled="disabled" value="<%= dept.get(0).getDepartmentName() %>" </td>
                                <td><input type="submit" value="Save" style="width: 100px;"/></td>
                            </tr>
                        </table>
                            <form action="../../AssignDosenServlet" method="get">
                            <table style="margin-left: 90px; margin-top: 20px; width: 800px;">
                                <thead style="color: white; background-color: black;">
                                    <th>No</th>
                                    <th>Kode Matkul</th>
                                    <th>Nama Matkul</th>
                                    <th>Nama Dosen</th>
                                </thead>
                                <%
                                    List<TeachPeriod> mtk = sess.createQuery("from TeachPeriod").list();
                                    int i = 1;
                                    for(TeachPeriod m : mtk) {
                                        %>
                                        <tr>    
                                            <td style="border-bottom: 1px dotted black;"><%= i %></td>
                                            <td style="border-bottom: 1px dotted black;"><%= m.getMatkul().getMatkulId() %></td>
                                            <td style="border-bottom: 1px dotted black;"><%= m.getMatkul().getMatkulName()%></td>
                                            <td style="border-bottom: 1px dotted black;">
                                                <select name="dosen" style="width: 180px;">
                                                    <%
                                                        List<Lectures> listLectures = sess.createQuery("From Lectures").list();
                                                        for(Lectures o : listLectures) {
                                                            %>
                                                            <option value="<%= o.getLectureId() %>" <% if(o.getLectureId()==m.getLectures().getLectureId()){ out.print("selected='selected'"); } %>><%= o.getLectureId() %> - <%= o.getLectureName() %></option>
                                                            <%
                                                        }
                                                    %>
                                                </select>
                                                
                                            </td>
                                            
                                        </tr>
                                        <%
                                        i++;
                                    }
                                    %>
                            </table>
                            </form>
            </div>



        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
