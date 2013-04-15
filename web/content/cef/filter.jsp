<%-- 
    Document   : filter
    Created on : Apr 15, 2013, 11:05:45 AM
    Author     : Acer
--%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<div id="filter">
    <form action="view.jsp" method="get">
        <fieldset>
            <p>Filter By : </p>
            <select name="filter">
                <option value="1">ID</option>
                <option value="2">Name</option>
                <option value="3">Departemen</option>
            </select>
            <input type="text" name="keyword" />
            <input type="submit" value="Process"/>
        </fieldset>
    </form>
</div>