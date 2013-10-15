
<%@ page import="gradadvising.Subject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/gradAdvising/subject/list">Course Listing</a></li>
		
			<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
   
		
			<div class="container-fluid">
		
			<div class="span8">
			<div class="hero-unit">
			
			<!-- <h3> Course Info </h3> -->
			
				<g:if test="${subjectInstance?.subjectCode}">
				<li class="fieldcontain">
					<h3><span id="subjectCode-label" class="property-label"><g:message code="subject.subjectCode.label" default="Subject Code" /></span></h3>
					<span class="property-value" aria-labelledby="subjectCode-label"><g:fieldValue bean="${subjectInstance}" field="subjectCode"/></span>
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.subjectDescription}">
				<li class="fieldcontain">
					<h3><span id="subjectDescription-label" class="property-label"><g:message code="subject.subjectDescription.label" default="Subject Description" /></span></h3>
					<span class="property-value" aria-labelledby="subjectDescription-label"><g:fieldValue bean="${subjectInstance}" field="subjectDescription"/></span>
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.unitLoad}">
				<li class="fieldcontain">
					<h3><span id="unitLoad-label" class="property-label"><g:message code="subject.unitLoad.label" default="Unit Load" /></span></h3>
					<span class="property-value" aria-labelledby="unitLoad-label"><g:fieldValue bean="${subjectInstance}" field="unitLoad"/></span>
				</li>
				</g:if>
			
				<!-- <g:if test="${subjectInstance?.isCore}">
				<li class="fieldcontain">
					<span id="isCore-label" class="property-label"><g:message code="subject.isCore.label" default="Is Core" /></span>
					<span class="property-value" aria-labelledby="isCore-label"><g:formatBoolean boolean="${subjectInstance?.isCore}" /></span>
				</li>
				</g:if> -->
			
				<g:if test="${subjectInstance?.yrsem}">
				<li class="fieldcontain">
					<h3><span id="yrsem-label" class="property-label"><g:message code="subject.yrsem.label" default="Year & Semester" /></span></h3>
					<span class="property-value" aria-labelledby="yrsem-label"><g:link controller="yearSem" action="show" id="${subjectInstance?.yrsem?.id}">${subjectInstance?.yrsem?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
	
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subjectInstance?.id}" />
					<g:link class="btn" action="edit" id="${subjectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-dangers" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
