<%@ page import="gradadvising.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	
	<body>
		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span1">
		</div>
		
		<div class="span10">

		<div>	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;"> 
	
		<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
		
			<div class="container-fluid">
			<div class="hero-unit">

	<h2>Student Information</h2>
	
	<table border="0" cellpadding="0">
	<td>
			<b>ID Number:</b>			<g:fieldValue bean="${studentInstance}" field="idNumber"/><br>
			<b>Student Name:</b>		<g:fieldValue bean="${studentInstance}" field="studentName"/><br>
			<b>Under Graduate:</b>		<g:fieldValue bean="${studentInstance}" field="underGradCourse"/><br>
			<b>Bachelor's Degree:</b> 	<g:fieldValue bean="${studentInstance}" field="bachelorsDegree"/><br>
	</td>
	<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	<b>Program Enrolled:</b>	<g:link controller="program" action="show" id="${studentInstance?.program?.id}">${studentInstance?.program?.encodeAsHTML()}</g:link><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>Year LvL:</b>			<g:fieldValue bean="${studentInstance}" field="yearLevel"/><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>Date Enrolled:</b>		<g:formatDate date="${studentInstance?.dateEnrolled}"/><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>Year & Semester:</b>		<g:link controller="yearSem" action="show" id="${studentInstance?.yrsem?.id}">${studentInstance?.yrsem?.encodeAsHTML()}</g:link></br>
	</td>
	</table>
	
	
	<!-- enrollements -->
	
	<div class="span4">
	<td>		
				<g:if test="${studentInstance?.enrollments}">
				<li class="fieldcontain">
					<span id="enrollments-label" class="property-label"><g:message code="student.enrollments.label" default="Enrollments" /></span>
						<g:each in="${studentInstance.enrollments}" var="e">
						<span class="property-value" aria-labelledby="enrollments-label"><g:link controller="enrollments" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
				<!-- <g:if test="${studentInstance?.yrsem}">
				<li class="fieldcontain">
					<span id="yrsem-label" class="property-label"><g:message code="student.yrsem.label" default="Yrsem" /></span>
						<span class="property-value" aria-labelledby="yrsem-label"></span>
				</li>
				</g:if> -->
				
			</ol>
		</td>
	</div>
	
	
	<!-- edit/delete -->		
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Update" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>
	</body>
</html>