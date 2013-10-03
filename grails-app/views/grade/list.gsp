<%@ page import="gradadvising.Grade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grade.label', default: 'Grade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	
	<body>
		<<br><br>
		
		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
		<div class="span8">
	
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<center><h3> Grades </h3></center>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><g:message code="grade.enrollments.label" default="Enrollments" /></th>
						<th><g:message code="grade.subject.label" default="Subject" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${gradeInstanceList}" status="i" var="gradeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: gradeInstance, field: "enrollments")}</td>
						<td>${fieldValue(bean: gradeInstance, field: "subject")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gradeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
