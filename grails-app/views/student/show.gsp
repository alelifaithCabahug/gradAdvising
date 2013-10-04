<%@ page import="gradadvising.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<br><br>
		
		<div align="center">	
		<ul class="nav nav-pills" style="border: solid 0px #0000FF;">
	
		<li class="active"><a href="http://localhost:8080/gradAdvising/student/list">Student List</a></li>
		
		<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
   
		
			<div class="container-fluid">
		
			<div class="span12">
			<div class="hero-unit">
	
		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
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

	<g:link class="btn" controller="enrollments" action="create" id="${studentInstance?.id}">Add Semester</g:link></br>
	</td>
	<!-- enrollements 
	<td>		
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
						<span class="property-value" aria-labelledby="yrsem-label"></span>
				</li>
				</g:if> 
				
			</ol>
		</td> -->
	
	<!-- Tables for enrolled subjects with grades -->
	
<g:each in="${studentInstance.enrollments}" var="enr">
	
	<p>
	<br>
	<br>
	
	<div id="container" style="background-color:#e0f3f8; width:300px; float:center; margin-left:50px">
	
	<center>
	<h4> ${enr.yrsem} </h4>
	
	<table border="1">
		<g:sortableColumn property="column" title="${message(code: 'user.id.label', default: 'Subject Name')}" />
		<g:sortableColumn property="column" title="${message(code: 'user.id.label', default: 'Grade')}" />
		
		<g:each in="${enr.grade}" status="i" var="subjects">
		<tr>
			<td>${subjects.subject}</td>
			<td><center>${subjects.grade}</center></td>
		</tr>
		</g:each>
	</table>
			<align="left">GPA: ${enr.getGPA()} &nbsp;&nbsp;&nbsp;</a>
			<g:link class="btn" controller="grade" action="create" id="${enr?.id}">Add Grade</g:link></br>
	
			</a>

	</div>
</g:each>

	</center>
	
	
	
	<br>
	<br>
	<p>
	
	<!-- edit/delete -->		
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentInstance?.id}" />
					<g:link class="btn" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Update" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>
	</body>
</html>
