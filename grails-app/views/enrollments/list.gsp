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
				
					<th>
					<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'yrsem', 'error')} required">
						<label for="yrsem">
							<g:message code="student.yrsem.label" default="Yrsem" />
							<span class="required-indicator">*</span>
					</label>
				<g:select id="yrsem" name="yrsem.id" from="${gradadvising.YearSem.list()}" optionKey="id" required="" value="${studentInstance?.yrsem?.id}" class="many-to-one"/>
				</div>
				</th>

					<th>
					<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'program', 'error')} required">
						<label for="program">
							<g:message code="student.program.label" default="Program" />
							<span class="required-indicator">*</span>
					</label>
				<g:select id="program" name="program.id" from="${gradadvising.Program.list()}" optionKey="id" required="" value="${studentInstance?.program?.id}" class="many-to-one"/>
				</div>	
					
					</th>
					
					
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
