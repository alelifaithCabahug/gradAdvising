
<%@ page import="gradadvising.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-student" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idNumber" title="${message(code: 'student.idNumber.label', default: 'Id Number')}" />
					
						<g:sortableColumn property="studentName" title="${message(code: 'student.studentName.label', default: 'Student Name')}" />
					
						<g:sortableColumn property="underGradCourse" title="${message(code: 'student.underGradCourse.label', default: 'Under Grad Course')}" />
					
						<g:sortableColumn property="bachelorsDegree" title="${message(code: 'student.bachelorsDegree.label', default: 'Bachelors Degree')}" />
					
						<th><g:message code="student.program.label" default="Program" /></th>
					
						<g:sortableColumn property="yearLevel" title="${message(code: 'student.yearLevel.label', default: 'Year Level')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentInstanceList}" status="i" var="studentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "idNumber")}</g:link></td>
					
						<td>${fieldValue(bean: studentInstance, field: "studentName")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "underGradCourse")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "bachelorsDegree")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "program")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "yearLevel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
