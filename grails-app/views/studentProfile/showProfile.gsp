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
		<div class="span2">
		</div>
		
		<div class="span8">

		<div>	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;"> 
	
		<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
		
	<h2>Student Information</h2>
	
	<table border="0" cellpadding="0">
	<td>
			<b>ID Number:</b>			<g:fieldValue bean="${studentInstance}" field="idNumber"/><br>
			<b>Student Name:</b>		<g:fieldValue bean="${studentInstance}" field="studentName"/><br>
			<b>Under Graduate:</b>		<g:fieldValue bean="${studentInstance}" field="underGradCourse"/><br>
			<b>Bachelor's Degree:</b> 	<g:fieldValue bean="${studentInstance}" field="bachelorsDegree"/><br>
	</td>
	<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	<b>Program Enrolled:</b>	${studentInstance?.program?.encodeAsHTML()}<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>Year LvL:</b>			<g:fieldValue bean="${studentInstance}" field="yearLevel"/><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>Date Enrolled:</b>		<g:formatDate date="${studentInstance?.dateEnrolled}"/><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>Year & Semester:</b>		${studentInstance?.yrsem?.encodeAsHTML()}</br>
	</td>
	</table>
	
	
	<!-- Tables for enrolled subjects with grades -->
	
<g:each in="${studentInstance.enrollments}" var="enr">
	
	<p>
	<br>
	<br>
	
	<div id="container" style="background-color:#e0f3f8; clear:both; width:300px; float:center; margin-left:30px">
	
	TERM: ${enr.yrsem} 
	
	
	<table border="1">
		<tr>
			<td>Subject</td>
			<td>Grade</td>
		</tr>
		
		<g:each in="${enr.grade}" status="i" var="subjects">
		<tr>
			<td>${subjects.subject}</td>
			<td><center>${subjects.grade}</center></td>
		</tr>
		</g:each>
	
	</table>
		<align="right">GPA: ${enr.getGPA()} &nbsp;&nbsp;&nbsp;</a>
	</div>
</g:each>
	
		</div>
	</body>
</html>
