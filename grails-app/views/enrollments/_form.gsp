<%@ page import="gradadvising.Enrollments" %>



<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="enrollments.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${gradadvising.Student.list()}" optionKey="id" required="" value="${enrollmentsInstance?.student?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="enrollments.subject.label" default="Subject" />
		
	</label>
	<g:select name="subject" from="${gradadvising.Subject.list()}" multiple="multiple" optionKey="id" size="5" value="${enrollmentsInstance?.subject*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'yrsem', 'error')} required">
	<label for="yrsem">
		<g:message code="enrollments.yrsem.label" default="Yrsem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="yrsem" name="yrsem.id" from="${gradadvising.YearSem.list()}" optionKey="id" required="" value="${enrollmentsInstance?.yrsem?.id}" class="many-to-one"/>
</div>

