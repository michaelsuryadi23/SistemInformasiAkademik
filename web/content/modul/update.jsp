<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.ModulId"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Modul"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modul - Sistem Informasi Akademik</title>
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
        
        <div id="content">
            <jsp:include page="../sidemenu.jsp"/>
            <jsp:include page="privilage.jsp" />
            <%
                int id = Integer.parseInt(request.getParameter("modul_id"));
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<Modul> modul = sess.createQuery("from Modul where modul_id="+id).list();
                List<ModulId> modulId = sess.createQuery("from ModulId where modulId="+id).list();
                Modul modulData = modul.get(0);
                ModulId modulId = modulId.get(0);
                %>
            <h2 style="text-align: center; margin-left: 20px; padding-top: 10px;">Input Modul</h2>
            <form name='f' action="ModulServlet?mode=1" method='POST'>
                <div id="content-left" style="margin-left: 300px; width: 400px;">
                    <fieldset>
                        <table>
                            <tr><td><label for="username">Modul ID : </label></td>
                                <td><input type="text" name="modul_id" style="height: 20px; width: 200px" readonly="readonly" value="<%= modulData.getId() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Modul Content : </label></td>
                                <td><input type="text" name="univName" style="height: 20px; width: 200px" value="<%= modulData.getModulContent() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Release Date : </label></td>
                                <td><input type="text" name="univAddress" style="height: 20px; width: 200px" value="<%= modulId.getReleaseDate().toString() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Matkul ID  : </label></td>
                                <td><input type="text" name="univAddress" style="height: 20px; width: 200px" value="<%= modulData.getMatkul() %>"></td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Update" style="height: 30px; width: 200px;"/></td>
                            </tr>
                            
                        <br/>
                        </table>
                    </fieldset>
                </div>
            </form>
        </div>

    

<jsp:include page="../footer.jsp"/>

</body>
</html>
