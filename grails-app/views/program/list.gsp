
<%@ page import="gradadvising.Program" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
		
		
	<body>
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
		
		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Program/create">
		<i class="icon-info-sign"></i> Add Program</a>
		</li>

		<div id="list-program" class="content scaffold-list" role="main">
			<center><h1><g:message code="default.list.label" args="[entityName]" /></h1></center>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			
				<table class="table table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="programName" title="${message(code: 'program.programName.label', default: 'Program Name')}" />
					
						<!-- <g:sortableColumn property="numberOfYears" title="${message(code: 'program.numberOfYears.label', default: 'Number Of Years')}" /> -->
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${programInstanceList}" status="i" var="programInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${programInstance.id}">${fieldValue(bean: programInstance, field: "programName")}</g:link></td>
					
						<!-- <td>${fieldValue(bean: programInstance, field: "numberOfYears")}</td> -->
					
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
