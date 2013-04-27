<%@page import="com.rpll.model.Modul"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<div id="filter">
    <form action="list.jsp" method="get">
        <fieldset>
            <p>Filter By : </p>
            <select name="filter">
                <option value="1">Modul ID</option>
                <option value="2">Modul Content</option>
                <option value="3">Release Date</option>
                <option value="4">Matkul</option>
            </select>
            <input type="text" name="keyword" />
            <input type="submit" value="Process"/>
        </fieldset>
    </form>
</div>