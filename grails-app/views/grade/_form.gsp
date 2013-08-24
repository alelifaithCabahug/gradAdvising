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
<%@ page import="gradadvising.Grade" %>



