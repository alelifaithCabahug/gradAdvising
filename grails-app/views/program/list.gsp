<%@ page import="gradadvising.Program" %>

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
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Program/create">
		<i class="icon-info-sign"></i> New Program</a>
		</li>
		
		
		<g:form action="searchProgram" controller="student" class="">
					<g:textField name="Name" value="${params.input}" size="20" placeholder="Search Program"/>
					<g:submitButton name="search" class="buttons" value="Search" />
		</g:form> 
		
		
		</div>
		
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			
			<center><h3> Programs Offered </h3></center>
			<table class="table table-bordered">
				<thead>
				
					<tr>
					
						<g:sortableColumn property="programName" title="${message(code: 'program.programName.label', default: 'Program Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${programInstanceList}" status="i" var="programInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${programInstance.id}">${fieldValue(bean: programInstance, field: "programName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${programInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
