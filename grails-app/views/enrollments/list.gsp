<%@ page import="gradadvising.Enrollments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollments.label', default: 'Enrollments')}" />
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
			<table>
				<thead>
					<tr>
					
						<th><g:message code="enrollments.student.label" default="Student" /></th>
					
						<th><g:message code="enrollments.yrsem.label" default="Yrsem" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enrollmentsInstanceList}" status="i" var="enrollmentsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enrollmentsInstance.id}">${fieldValue(bean: enrollmentsInstance, field: "student")}</g:link></td>
					
						<td>${fieldValue(bean: enrollmentsInstance, field: "yrsem")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enrollmentsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
