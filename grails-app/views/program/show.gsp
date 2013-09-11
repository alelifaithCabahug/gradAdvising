<%@ page import="gradadvising.Program" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
		
	<body>
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/gradAdvising/program/list">Program Listing</a></li>
		
			<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
   
		
			<div class="container-fluid">
		
			<div class="span8">
			<div class="hero-unit">
			
			<!-- <h3> Program Info </h3> -->
			
				<g:if test="${programInstance?.programName}">
				<li class="fieldcontain">
					<h3><span id="programName-label" class="property-label"><g:message code="program.programName.label" default="Program Name" /></span></h3>
					<span class="property-value" aria-labelledby="programName-label"><g:fieldValue bean="${programInstance}" field="programName"/></span>
				</li>
				</g:if>
			
				<g:if test="${programInstance?.numberOfYears}">
				<li class="fieldcontain">
					<h3><span id="numberOfYears-label" class="property-label"><g:message code="program.numberOfYears.label" default="Program Duration" /></span></h3>
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
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${programInstance?.id}" />
					<g:link class="edit" action="edit" id="${programInstance?.id}"><g:message code="default.button.edit.label" default='Update' /></g:link>
					<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /> -->
				</fieldset>
			</g:form>
			
	</div>
	</body>
</html>
