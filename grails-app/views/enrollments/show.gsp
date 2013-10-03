
<%@ page import="gradadvising.Enrollments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollments.label', default: 'Enrollments')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="container-fluid">
		
			<div class="span8">
			<div class="hero-unit">
			
			<h1>Enrollment</h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
				<g:if test="${enrollmentsInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="enrollments.grade.label" default="Grade" /></span>
						<g:each in="${enrollmentsInstance.grade}" var="g">
						<span class="property-value" aria-labelledby="grade-label"><g:link controller="grade" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
				<g:if test="${enrollmentsInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="enrollments.student.label" default="Student" /></span>
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${enrollmentsInstance?.student?.id}">${enrollmentsInstance?.student?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${enrollmentsInstance?.yrsem}">
				<li class="fieldcontain">
					<span id="yrsem-label" class="property-label"><g:message code="enrollments.yrsem.label" default="Yrsem" /></span>
						<span class="property-value" aria-labelledby="yrsem-label"><g:link controller="yearSem" action="show" id="${enrollmentsInstance?.yrsem?.id}">${enrollmentsInstance?.yrsem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${enrollmentsInstance?.id}" />
					<g:link class="edit" action="edit" id="${enrollmentsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
	</div>
	</body>
</html>
