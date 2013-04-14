<%@page import="com.rpll.model.University"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<div id="filter">
    <form action="list.jsp" method="get">
        <fieldset>
            <p>Filter By : </p>
            <select name="filter">
                <option value="1">ID Dosen</option>
                <option value="2">Nama Dosen</option>
            </select>
            <input type="text" name="keyword" />
            <input type="submit" value="Process"/>
        </fieldset>
    </form>
</div>