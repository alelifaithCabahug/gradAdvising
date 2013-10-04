
<%@ page import="gradadvising.Adviser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adviser.label', default: 'Adviser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	
	<body>
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 0px #0000FF;">
	
		<li class="active"><a href="http://localhost:8080/gradAdvising/adviser/list">Adviser List</a></li>
		
			<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
   
		
			<div class="container-fluid">
		
			<div class="span8">
			<div class="hero-unit">
			
			<!-- <h3> Adviser Info </h3> -->
			
		
		
				<g:if test="${adviserInstance?.username}">
				<li class="fieldcontain">
					<h3><span id="username-label" class="property-label"><g:message code="adviser.username.label" default="Username:" /></span></h3>
					<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${adviserInstance}" field="username"/></span>
				</li>
				</g:if>
			
		
				
				<g:if test="${adviserInstance?.password}">
				<li class="fieldcontain">
					<h3><span id="password-label" class="property-label"><g:message code="asviser.password.label" default="Password:" /></span></h3>
					<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${adviserInstance}" field="password"/></span>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${adviserInstance?.id}" />
					<g:link class="edit" action="edit" id="${adviserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
