<%@ page import="gradadvising.Subject" %>

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
		<a class="btn btn-small btn-info" href="http://localhost:8080/gradAdvising/Subject/create">
		<i class="icon-info-sign"></i> Add Subject</a>
		</li>
		
		
		<g:form action="searchSubject" controller="student" class="">
					<g:textField name="lastname" value="${params.input}" size="20" placeholder="Search Subject"/>
					<g:submitButton name="search" class="buttons" value="Search" />
		</g:form> 
		
		
		</div>
		
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			
			<center><h3> Courses Offered </h3></center>
			<table class="table table-bordered">
				<thead>
				
					<tr>					
						<g:sortableColumn property="subjectCode" title="${message(code: 'subject.subjectCode.label', default: 'Subject Code')}" />
					
						<g:sortableColumn property="subjectDescription" title="${message(code: 'subject.subjectDescription.label', default: 'Subject Description')}" />
					
						<g:sortableColumn property="unitLoad" title="${message(code: 'subject.unitLoad.label', default: 'Unit Load')}" />
					
						<g:sortableColumn property="isCore" title="${message(code: 'subject.isCore.label', default: 'Core')}" />
					
						<th><g:message code="subject.yrsem.label" default="Yrsem" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subjectInstanceList}" status="i" var="subjectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subjectInstance.id}">${fieldValue(bean: subjectInstance, field: "subjectCode")}</g:link></td>
					
						<td>${fieldValue(bean: subjectInstance, field: "subjectDescription")}</td>
					
						<td>${fieldValue(bean: subjectInstance, field: "unitLoad")}</td>
					
						<td><g:formatBoolean boolean="${subjectInstance.isCore}" /></td>
					
						<td>${fieldValue(bean: subjectInstance, field: "yrsem")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subjectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
