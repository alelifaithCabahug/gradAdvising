
<%@ page import="gradadvising.Adviser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adviser.label', default: 'Adviser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	
	<body>
	<br><br>
			<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
		<div class="span8">
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;">
		</div>
		<div id="list-enrollments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Adviser/create">
		<i class="icon-info-sign"></i> Add Adviser</a>
		</li>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-adviser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<table class="table table-bordered">
						<g:sortableColumn property="username" title="${message(code: 'adviser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'adviser.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adviserInstanceList}" status="i" var="adviserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adviserInstance.id}">${fieldValue(bean: adviserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: adviserInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adviserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
