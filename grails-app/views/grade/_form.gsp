<%@ page import="gradadvising.Grade" %>
<%@ page import="gradadvising.Enrollments" %>
<%@ page import="gradadvising.Subject" %>


<g:if test="${!params.enrollmentId}">
<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'enrollments', 'error')} required">
	<label for="enrollments">
		<g:message code="grade.enrollments.label" default="Enrollments" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enrollments" name="enrollments.id" from="${gradadvising.Enrollments.list()}" optionKey="id" required="" value="${gradeInstance?.enrollments?.id}" class="many-to-one"/>
</div>
</g:if>


<g:if test="${params.enrollmentId}">
<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'enrollments', 'error')} required">
	<label for="enrollments">
		<g:message code="grade.enrollments.label" default="Enrollments" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id="enrollments" name="enrollments.id" value="${params.enrollmentId}"/>${Enrollments.get(params.enrollmentId)}
	
	</div>
	&nbsp;

</g:if>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="grade.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="grade" from="${gradeInstance.constraints.grade.inList}" required="" value="${gradeInstance?.grade}" valueMessagePrefix="grade.grade"/>
</div>

<g:if test="${!params.subjectID}">
<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="grade.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subject" name="subject.id" from="${gradadvising.Subject.list()}" optionKey="id" required="" value="${gradeInstance?.subject?.id}" class="many-to-one"/>
</div>
</g:if>

<g:if test="${params.subjectID}">
<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="grade.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id="subject" name="subject.id" value="${params.subjectID}"/>${Subject.get(params.subjectID)}
	
	</div>
	&nbsp;

</g:if>
