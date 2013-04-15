<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Rooms"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.University"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rooms - Sistem Informasi Akademik</title>
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
                int id = Integer.parseInt(request.getParameter("room_id"));
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<Rooms> rooms = sess.createQuery("from Rooms where roomId="+id).list();
                Rooms roomsData = rooms.get(0);
                %>
            <h2 style="text-align: center; margin-left: 20px; padding-top: 10px;">Input Badan Hukum</h2>
            <form name='f' action="RoomsServlet?mode=1" method='POST'>
                <div id="content-left" style="margin-left: 300px; width: 400px;">
                    <fieldset>
                        <table>
                            <tr><td><label for="username">Room ID : </label></td>
                                <td><input type="text" name="univId" style="height: 20px; width: 200px" readonly="readonly" value="<%= roomsData.getRoomId() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Room Type : </label></td>
                                <td><input type="text" name="univName" style="height: 20px; width: 200px" value="<%= roomsData.getRoomType() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Address : </label></td>
                                <td><input type="text" name="univAddress" style="height: 20px; width: 200px" value="<%= roomsData.getRoomLocation() %>"></td>
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
