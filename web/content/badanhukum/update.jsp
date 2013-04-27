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
                int id = Integer.parseInt(request.getParameter("univId"));
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<University> univ = sess.createQuery("from University where univId="+id).list();
                University univData = univ.get(0);
                %>
            <h2 style="text-align: center; margin-left: 20px; padding-top: 10px;">Update Badan Hukum</h2>
            <form name='f' action="../../BadanHukumServlet?mode=2" method='POST'>
                <div id="content-left" style="margin-left: 300px; width: 400px;">
                    <fieldset>
                        <table>
                            
                                <input type="hidden" name="univId" style="height: 20px; width: 200px" readonly="readonly" value="<%= univData.getUnivId() %>">
                            
                            <tr>
                                <td> <label for="username">Univ Name : </label></td>
                                <td><input type="text" name="univName" style="height: 20px; width: 200px" value="<%= univData.getUnivName() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Address : </label></td>
                                <td><input type="text" name="univAddress" style="height: 20px; width: 200px" value="<%= univData.getUnivAddress() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Telp : </label></td>
                                <td><input type="text" name="univTelp" style="height: 20px; width: 200px" value="<%= univData.getUnivTelp() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Email : </label></td>
                                <td><input type="text" name="univEmail" style="height: 20px; width: 200px" value="<%= univData.getUnivEmail() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Homepage : </label></td>
                                <td><input type="text" name="univHomepage" style="height: 20px; width: 200px" value="<%= univData.getUnivHomepage() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">No Akreditasi : </label></td>
                                <td><input type="text" name="univNoAkreditasi" style="height: 20px; width: 200px" value="<%= univData.getNoAkreditasi() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Akreditasi : </label></td>
                                <td><input type="text" name="univAkreditasi" style="height: 20px; width: 200px" value="<%= univData.getAkreditasi() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Found Date :</label></td>
                                <td><input type="text" name="univFound" style="height: 20px; width: 200px" value="<%= univData.getFoundDate().toString() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Nama Rektor :</label></td>
                                <td><input type="text" name="univRector" style="height: 20px; width: 200px" value="<%= univData.getRector() %>"></td>
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
