<%@ page import="gradadvising.Program" %>
<%@ page import="gradadvising.Subject" %>



<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'programName', 'error')} required">
	<label for="programName">
		<g:message code="program.programName.label" default="Program Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="programName" required="" value="${programInstance?.programName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'numberOfYears', 'error')} required">
	<label for="numberOfYears">
		<g:message code="program.numberOfYears.label" default="Number Of Years" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfYears" type="number" min="1" max="5" value="${programInstance.numberOfYears}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'student', 'error')} ">
	<label for="student">
		<g:message code="program.student.label" default="Student" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${programInstance?.student?}" var="s">
    <li><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="student" action="create" params="['program.id': programInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="program.subject.label" default="Subject" />
	</label>

		<table>
			<tr>
				<td>Select All</td>
				<td><g:checkBox id="select_all" name="select_all" value="" onclick="selectAll();" /></td>
			</tr>
			
			<g:each in="${gradadvising.Subject.list()}"  var="subjectInstance">
			<tr>
				<td>${subjectInstance.subjectCode}</td>
				<td>
					<g:checkBox id="${subjectInstance.id}" name="marked_subjects" value="${subjectInstance.id}" checked="${false}" />	
				</td>
				<br>
			</tr>
			</g:each>
		</table>
</div>