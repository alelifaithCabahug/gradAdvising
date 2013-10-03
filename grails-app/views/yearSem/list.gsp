<%@ page import="gradadvising.YearSem" %>
<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'yearSem.label', default: 'YearSem')}" />
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
		
		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/YearSem/create">
		<i class="icon-info-sign"></i> Add YearSem</a>
		</li>
		
		<div id="list-yearSem" class="content scaffold-list" role="main">
			<center><h3>Year & Semester</h3></center>
			
			<g:if test="${flash.message}">
			<div class="alert alert-info">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<g:sortableColumn property="year" title="${message(code: 'yearSem.year.label', default: 'Year')}" />
						<g:sortableColumn property="sem" title="${message(code: 'yearSem.sem.label', default: 'Sem')}" />
					</tr>
				</thead>
				
				<tbody>
				<g:each in="${yearSemInstanceList}" status="i" var="yearSemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: yearSemInstance, field: "year")}</td>
						<td>${fieldValue(bean: yearSemInstance, field: "sem")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="pagination">
				<g:paginate total="${yearSemInstanceTotal}" />
			</div>
			
		</div>
	</body>
</html>
