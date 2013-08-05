<%@ page import="gradadvising.Program" %>



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
	<g:field name="numberOfYears" type="number" value="${programInstance.numberOfYears}" required=""/>
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
	<g:select name="subject" from="${gradadvising.Subject.list()}" multiple="multiple" optionKey="id" size="5" value="${programInstance?.subject*.id}" class="many-to-many"/>
</div>

