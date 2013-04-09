<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.University"%>
<%@page import="com.rpll.model.Staff"%>
<%@page import="com.rpll.model.Jobs"%>
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
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">Create New Staff</h2>
                <%
                    int idStaff = Integer.parseInt(request.getParameter("idStaff"));
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    List<Staff> listStaff = sess.createQuery("from Staff where idStaff="+idStaff).list();
                    Staff staff = listStaff.get(0);
                %>
                
                <form action="UpdateStaffServlet" method="GET">
                    <table>
                        <tr>
                            <td>ID Staff :</td>
                            <td><input type="text" name="idStaff" value="<%= staff.getStaffId() %>"/></td>
                        </tr>
                        <tr>
                            <td>Nama Staff : </td>
                            <td><input type="text" name="nameStaff" value="<%= staff.getStaffName() %>"/></td>
                        </tr>
                        <tr>
                            <td>Alamat Staff :</td>
                            <td><input type="text" name="addressStaff" value="<%= staff.getStaffAddress() %>"/></td>
                        </tr>
                        <tr>
                            <td>Telp Staff : </td>
                            <td><input type="text" name="telpStaff" value="<%= staff.getStaffTelp() %>"/></td>
                        </tr>
                        <tr>
                            <td>Job :</td>
                            <%
                                Session sess2 = HibernateUtil.getSessionFactory().openSession();
                                List<Jobs> listJobs = sess2.createQuery("from Jobs").list();
                            %>
                            <td><select name="badanHukumId">
                                    <%
                                        for(Jobs o : listJobs){
                                    %>
                                    <option value="<%= o.getJobId() %>"><%= o.getJobName() %> <% if(staff.getJobs().getJobId()==o.getJobId()){ out.print("selected='selected'");}%>></option>
                                    <%
                                        }
                                    %>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Badan Hukum :</td>
                            <%
                                Session sess3 = HibernateUtil.getSessionFactory().openSession();
                                List<University> listUniv= sess3.createQuery("from University").list();
                            %>
                            <td><select name="badanHukumId">
                                    <%
                                        for(University o : listUniv){
                                    %>
                                    <option value="<%= o.getUnivId()%>" <% if(staff.getUniversity().getUnivId()==o.getUnivId()){ out.print("selected='selected'");} %>></option>
                                    <%
                                        }
                                    %>
                                </select></td>
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
