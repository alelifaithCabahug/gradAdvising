<%@ page import="gradadvising.Grade" %>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'enrollments', 'error')} required">
	<label for="enrollments">
		<g:message code="grade.enrollments.label" default="Enrollments" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enrollments" name="enrollments.id" from="${gradadvising.Enrollments.list()}" optionKey="id" required="" value="${gradeInstance?.enrollments?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="grade.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subject" name="subject.id" from="${gradadvising.Subject.list()}" optionKey="id" required="" value="${gradeInstance?.subject?.id}" class="many-to-one"/>
</div>

<!-- for grade list -->

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="grade.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="grade" from="${gradeInstance.constraints.grade.inList}" required="" value="${gradeInstance?.grade}" valueMessagePrefix="grade.grade"/>
</div>

<%@ page import="gradadvising.Grade" %>



