
<%@ page import="gradadvising.Adviser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adviser.label', default: 'Adviser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
			
		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Program/create">
		<i class="icon-info-sign"></i> New Adviser</a>
		</li>

		</div>
		<div id="list-adviser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
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
