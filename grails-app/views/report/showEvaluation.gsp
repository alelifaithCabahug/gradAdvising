<%@ page import="gradadvising.Student" %>
<%@ page import="gradadvising.Grade" %>
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
			</ul>
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

	</td>

	<!-- Tables for enrolled subjects with grades -->
	
<h2> Evaluation of Records</h2>
	<g:jasperReport  jasper="evaluation_of_records" controller="report" action="printEvaluation" format="PDF" name="(PDF)" >  Download
		<g:hiddenField name="studentId" value="${studentInstance?.id}"/>
	</g:jasperReport>
	
<g:each in="${studentInstance.getEnrollmentsList()}" var="enr">
	
	<p>

	<div id="container"  style="background-color:#e0f3f8; width:700px; float:center; margin-left:50px;border-style:solid;
								border-width:5px;">
	
	
	<h4> ${enr.yrsem} </h4>
	<center>
	<table border="1" >
			
			<tr>
				<td>Subject Code</td>
				<td>Subject Description</td>
				<td>Unit Load</td>
				<td>Grade</td>
				<td>GCompl</td>
			</tr>
			
		<g:each in="${enr.subject}" status="i" var="sub">
			
			<g:set var="studId" value="${studentInstance.id}" />
			<g:set var="enrId" value="${enr.id}" />
				<tr>
					
					<td>${sub.subjectCode}</td>
					<td>${sub.subjectDescription}</td>
					<td>${sub.unitLoad}</td>
					<td><center>${sub.findSubjectGrade(enrId)}</center></td>
					<td></td>
					
				</tr>
		</g:each>
	
			<tr>
				<td></td>
				<td></td>
				<td align="center">GPA </td>
				<td></td>
				<td>${enr.getGPA()} &nbsp;&nbsp;&nbsp;</td>
			</tr>
	</table>
		<br>

	</div>
</g:each>

	</center>
	
	
	
	<br>
	<br>
	<p>
	
	
		</div>
	</body>
</html>
