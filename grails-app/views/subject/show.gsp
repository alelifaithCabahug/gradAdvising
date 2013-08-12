
<%@ page import="gradadvising.Subject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
			
			<g:form action="searchSubject" controller="subject" class="">
					<g:textField name="subjectCode" value="${params.input}" size="20" placeholder="Search Subject"/>
					<g:submitButton name="search" class="buttons" value="Search" />
			</g:form> 
			
		</div>
		<div id="show-subject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subject">
			
				<g:if test="${subjectInstance?.subjectCode}">
				<li class="fieldcontain">
					<span id="subjectCode-label" class="property-label"><g:message code="subject.subjectCode.label" default="Subject Code" /></span>
					
						<span class="property-value" aria-labelledby="subjectCode-label"><g:fieldValue bean="${subjectInstance}" field="subjectCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.subjectDescription}">
				<li class="fieldcontain">
					<span id="subjectDescription-label" class="property-label"><g:message code="subject.subjectDescription.label" default="Subject Description" /></span>
					
						<span class="property-value" aria-labelledby="subjectDescription-label"><g:fieldValue bean="${subjectInstance}" field="subjectDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.unitLoad}">
				<li class="fieldcontain">
					<span id="unitLoad-label" class="property-label"><g:message code="subject.unitLoad.label" default="Unit Load" /></span>
					
						<span class="property-value" aria-labelledby="unitLoad-label"><g:fieldValue bean="${subjectInstance}" field="unitLoad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.isCore}">
				<li class="fieldcontain">
					<span id="isCore-label" class="property-label"><g:message code="subject.isCore.label" default="Is Core" /></span>
					
						<span class="property-value" aria-labelledby="isCore-label"><g:formatBoolean boolean="${subjectInstance?.isCore}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.yrsem}">
				<li class="fieldcontain">
					<span id="yrsem-label" class="property-label"><g:message code="subject.yrsem.label" default="Yrsem" /></span>
					
						<span class="property-value" aria-labelledby="yrsem-label"><g:link controller="yearSem" action="show" id="${subjectInstance?.yrsem?.id}">${subjectInstance?.yrsem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.program}">
				<li class="fieldcontain">
					<span id="program-label" class="property-label"><g:message code="subject.program.label" default="Program" /></span>
					
						<g:each in="${subjectInstance.program}" var="p">
						<span class="property-value" aria-labelledby="program-label"><g:link controller="program" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="subject.student.label" default="Student" /></span>
					
						<g:each in="${subjectInstance.student}" var="s">
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subjectInstance?.id}" />
					<g:link class="edit" action="edit" id="${subjectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
