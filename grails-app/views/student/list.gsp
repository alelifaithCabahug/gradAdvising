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
		
		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
		<div class="span8">
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;">
		
		<!--re added search -->
		
		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Student/create">
		<i class="icon-info-sign"></i> Add Student</a>
		</li>
		
			
			<fieldset class="buttons">
					<g:form action="searchStudent" controller="student" class="">
					<g:textField name="idNumber" value="${params.input}" size="20" placeholder="Search Student ID No."/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
			</fieldset>
		
		<!-- xxxx (c) Cabahug--->
		
		<div id="list-program" class="content scaffold-list" role="main">
			<center><h3>Student List</h3></center>
			<g:if test="${flash.message}">
			<div class="alert alert-error" role="status">${flash.message}</div>
			</g:if>
			
			
			<table>
				<thead>
					<table class="table table-bordered">
					<tr>
						<g:sortableColumn property="idNumber" title="${message(code: 'student.idNumber.label', default: 'ID No.')}" />
					
						<g:sortableColumn property="studentName" title="${message(code: 'student.studentName.label', default: 'Name')}" />
					
						<g:sortableColumn property="underGradCourse" title="${message(code: 'student.underGradCourse.label', default: 'Under Grad Course')}" />
					
						<g:sortableColumn property="bachelorsDegree" title="${message(code: 'student.bachelorsDegree.label', default: 'Bachelors Degree')}" />
					
						<th><g:message code="student.program.label" default="Program Enrolled" /></th>
					
						<g:sortableColumn property="yearLevel" title="${message(code: 'student.yearLevel.label', default: 'Year')}" />
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
