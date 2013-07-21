<%@ page import="gradadvising.Student" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	
	<body>
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
		
		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Student/create">
		<i class="icon-info-sign"></i> Add Student</a>
		</li>
		
		
		<g:form action="searchStudent" controller="student" class="">
					<g:textField name="Name" value="${params.input}" size="20" placeholder="Search Student"/>
					<g:submitButton name="search" class="buttons" value="Search" />
		</g:form> 
		
		
		</div>
		
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			
			<center><h3> Student List </h3></center>
			<table class="table table-bordered">
				<thead>
				
					<tr>
					
						<g:sortableColumn property="idNumber" title="${message(code: 'student.idNumber.label', default: 'ID Number')}" />
					
						<g:sortableColumn property="studentName" title="${message(code: 'student.studentName.label', default: 'Student Name')}" />
					
						<g:sortableColumn property="underGradCourse" title="${message(code: 'student.underGradCourse.label', default: 'UnderGrad Course')}" />
					
						<g:sortableColumn property="bachelorsDegree" title="${message(code: 'student.bachelorsDegree.label', default: 'Bachelors Degree')}" />
					
						<th><g:message code="student.program.label" default="Program" /></th>
					
						<g:sortableColumn property="dateEnrolled" title="${message(code: 'student.dateEnrolled.label', default: 'Date Enrolled')}" />
					
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
					
						<td><g:formatDate date="${studentInstance.dateEnrolled}" /></td>
					
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
