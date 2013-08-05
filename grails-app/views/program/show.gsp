
<%@ page import="gradadvising.Program" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-program" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-program" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list program">
			
				<g:if test="${programInstance?.programName}">
				<li class="fieldcontain">
					<span id="programName-label" class="property-label"><g:message code="program.programName.label" default="Program Name" /></span>
					
						<span class="property-value" aria-labelledby="programName-label"><g:fieldValue bean="${programInstance}" field="programName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.numberOfYears}">
				<li class="fieldcontain">
					<span id="numberOfYears-label" class="property-label"><g:message code="program.numberOfYears.label" default="Number Of Years" /></span>
					
						<span class="property-value" aria-labelledby="numberOfYears-label"><g:fieldValue bean="${programInstance}" field="numberOfYears"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="program.student.label" default="Student" /></span>
					
						<g:each in="${programInstance.student}" var="s">
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="program.subject.label" default="Subject" /></span>
					
						<g:each in="${programInstance.subject}" var="s">
						<span class="property-value" aria-labelledby="subject-label"><g:link controller="subject" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${programInstance?.id}" />
					<g:link class="edit" action="edit" id="${programInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
