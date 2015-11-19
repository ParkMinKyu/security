<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  <a href="<c:url value="/user/logout"/>">Logout</a> </P>

<P>  <a href="<c:url value="/checkAuth"/>">checkAuth</a> </P>

<P>  The time on the server is ${serverTime}. </P>

<p>principal : <sec:authentication property="principal"/></p>
<p>principal.username : <sec:authentication property="principal.username"/></p>
<p>principal.password : <sec:authentication property="principal.password"/></p>
<p>principal.email : <sec:authentication property="principal.email"/></p>
<p>principal.enabled : <sec:authentication property="principal.enabled"/></p>
<p>principal.accountNonExpired : <sec:authentication property="principal.accountNonExpired"/></p>

<p>url="/user/loginPage" : <sec:authorize url="/user/loginPage" var="t">${t }</sec:authorize></p>
<p>url="/admin/main" : <sec:authorize url="/admin/main" var="d">${d }</sec:authorize></p>
<p>url="/" : <sec:authorize url="/" var="s">${s }</sec:authorize></p>
<p>access="hasRole('ROLE_USER')" : <sec:authorize access="hasRole('ROLE_USER')" var="u">${u }</sec:authorize></p>
<p>access="hasRole('ROLE_ADMIN')" : <sec:authorize access="hasRole('ROLE_ADMIN')" var="a">${a }</sec:authorize></p>
<p>ifNotGranted="hasRole('ROLE_USER')" : <sec:authorize ifNotGranted="hasRole('ROLE_USER')" var="b">${b }</sec:authorize></p>
<p>ifNotGranted="hasRole('ROLE_ADMIN')" : <sec:authorize ifNotGranted="hasRole('ROLE_ADMIN')" var="c">${c }</sec:authorize></p>
<p>ifAllGranted="hasRole('ROLE_USER')" : <sec:authorize ifAllGranted ="hasRole('ROLE_USER')" var="b">${b }</sec:authorize></p>
<p>ifAllGranted="hasRole('ROLE_ADMIN')" : <sec:authorize ifAllGranted="hasRole('ROLE_ADMIN')" var="c">${c }</sec:authorize></p>

<p>
	<sec:accesscontrollist domainObject="${contact}" hasPermission="8,16">
	  <td><A HREF="<c:url value="del.htm"><c:param name="contactId" value="${contact.id}"/></c:url>">Del</A></td>
	</sec:accesscontrollist>
</p>

</body>
</html>
