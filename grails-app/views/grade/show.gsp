
<%@ page import="gradadvising.Grade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grade.label', default: 'Grade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-grade" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grade">
			
				<g:if test="${gradeInstance?.enrollments}">
				<li class="fieldcontain">
					<span id="enrollments-label" class="property-label"><g:message code="grade.enrollments.label" default="Enrollments" /></span>
					
						<span class="property-value" aria-labelledby="enrollments-label"><g:link controller="enrollments" action="show" id="${gradeInstance?.enrollments?.id}">${gradeInstance?.enrollments?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradeInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="grade.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label">${gradeInstance.getEquivalentGrade()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${gradeInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="grade.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:link controller="subject" action="show" id="${gradeInstance?.subject?.id}">${gradeInstance?.subject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gradeInstance?.id}" />
					<g:link class="edit" action="edit" id="${gradeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
