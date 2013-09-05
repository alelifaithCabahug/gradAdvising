
<%@ page import="gradadvising.Enrollments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollments.label', default: 'Enrollments')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-enrollments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-enrollments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
				
					<th><g:message code="subject.yrsem.label" default="Year & Semester" /></th>
					<th><g:message code="subject.program.label" default="Program" /></th>
				
				<table class="table table-bordered">
					<tr>
					
						<g:sortableColumn property="student" title="${message(code: 'student.Student.label', default: 'Student')}" />
						
						<g:sortableColumn property="yearLevel" title="${message(code: 'student.yearLevel.label', default: 'Year Level')}" />
					
						<g:sortableColumn property="dateEnrolled" title="${message(code: 'student.dateEnrolled.label', default: 'Date Enrolled')}" />
 
						
						<!-- <g:sortableColumn property="YrSem" title="${message(code: 'program.YrSem.label', default: 'YrSem')}" /> --!>
						
								
					<tr>
				
					
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
