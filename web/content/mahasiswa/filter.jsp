<%@page import="com.rpll.model.Announcements"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<div id="filter">
    <form action="list.jsp" method="get">
        <fieldset>
            <p>Filter By : </p>
            <select name="filter">
                <option value="1">NIM</option>
                <option value="2">Department ID</option>
            </select>
            <input type="text" name="keyword" />
            
    </fieldset>
    </form>
</div>