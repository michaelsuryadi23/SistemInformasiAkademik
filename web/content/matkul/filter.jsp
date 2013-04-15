<%@page import="com.rpll.model.Matkul"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<div id="filter">
    <form action="list.jsp" method="get">
        <fieldset>
            <p>Filter By : </p>
            <select name="filter">
                <option value="1">Matkul ID</option>
                <option value="2">Matkul Name</option>
                <option value="2">Matkul Type</option>
            </select>
            <input type="text" name="keyword" />
            <input type="submit" value="Process"/>
        </fieldset>
    </form>
</div>