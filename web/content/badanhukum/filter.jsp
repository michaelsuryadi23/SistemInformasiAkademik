<%@page import="com.rpll.model.University"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<div id="filter">
    <form action="list.jsp" method="get">
        <fieldset>
            <p>Filter By : </p>
            <select name="filter">
                <option value="1">Universitas ID</option>
                <option value="2">Universitas Name</option>
                <option value="3">No Akreditasi</option>
            </select>
            <input type="text" name="keyword" />
            <input type="submit" value="Process"/>
        </fieldset>
    </form>
</div>