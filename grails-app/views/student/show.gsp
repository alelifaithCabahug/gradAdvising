
<%@ page import="gradadvising.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-student" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.idNumber}">
				<li class="fieldcontain">
					<span id="idNumber-label" class="property-label"><g:message code="student.idNumber.label" default="Id Number" /></span>
					
						<span class="property-value" aria-labelledby="idNumber-label"><g:fieldValue bean="${studentInstance}" field="idNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.studentName}">
				<li class="fieldcontain">
					<span id="studentName-label" class="property-label"><g:message code="student.studentName.label" default="Student Name" /></span>
					
						<span class="property-value" aria-labelledby="studentName-label"><g:fieldValue bean="${studentInstance}" field="studentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.underGradCourse}">
				<li class="fieldcontain">
					<span id="underGradCourse-label" class="property-label"><g:message code="student.underGradCourse.label" default="Under Grad Course" /></span>
					
						<span class="property-value" aria-labelledby="underGradCourse-label"><g:fieldValue bean="${studentInstance}" field="underGradCourse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.bachelorsDegree}">
				<li class="fieldcontain">
					<span id="bachelorsDegree-label" class="property-label"><g:message code="student.bachelorsDegree.label" default="Bachelors Degree" /></span>
					
						<span class="property-value" aria-labelledby="bachelorsDegree-label"><g:fieldValue bean="${studentInstance}" field="bachelorsDegree"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.program}">
				<li class="fieldcontain">
					<span id="program-label" class="property-label"><g:message code="student.program.label" default="Program" /></span>
					
						<span class="property-value" aria-labelledby="program-label"><g:link controller="program" action="show" id="${studentInstance?.program?.id}">${studentInstance?.program?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.yearLevel}">
				<li class="fieldcontain">
					<span id="yearLevel-label" class="property-label"><g:message code="student.yearLevel.label" default="Year Level" /></span>
					
						<span class="property-value" aria-labelledby="yearLevel-label"><g:fieldValue bean="${studentInstance}" field="yearLevel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.dateEnrolled}">
				<li class="fieldcontain">
					<span id="dateEnrolled-label" class="property-label"><g:message code="student.dateEnrolled.label" default="Date Enrolled" /></span>
					
						<span class="property-value" aria-labelledby="dateEnrolled-label"><g:formatDate date="${studentInstance?.dateEnrolled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.withGPAof2Above}">
				<li class="fieldcontain">
					<span id="withGPAof2Above-label" class="property-label"><g:message code="student.withGPAof2Above.label" default="With GPA of2 Above" /></span>
					
						<span class="property-value" aria-labelledby="withGPAof2Above-label"><g:formatBoolean boolean="${studentInstance?.withGPAof2Above}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.withSuitableBackground}">
				<li class="fieldcontain">
					<span id="withSuitableBackground-label" class="property-label"><g:message code="student.withSuitableBackground.label" default="With Suitable Background" /></span>
					
						<span class="property-value" aria-labelledby="withSuitableBackground-label"><g:formatBoolean boolean="${studentInstance?.withSuitableBackground}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.enrollments}">
				<li class="fieldcontain">
					<span id="enrollments-label" class="property-label"><g:message code="student.enrollments.label" default="Enrollments" /></span>
					
						<g:each in="${studentInstance.enrollments}" var="e">
						<span class="property-value" aria-labelledby="enrollments-label"><g:link controller="enrollments" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.yrsem}">
				<li class="fieldcontain">
					<span id="yrsem-label" class="property-label"><g:message code="student.yrsem.label" default="Yrsem" /></span>
					
						<span class="property-value" aria-labelledby="yrsem-label"><g:link controller="yearSem" action="show" id="${studentInstance?.yrsem?.id}">${studentInstance?.yrsem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
