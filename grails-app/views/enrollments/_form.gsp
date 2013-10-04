<%@ page import="gradadvising.Enrollments" %>
<%@ page import="gradadvising.Student" %>

<!--
<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'grade', 'error')} ">
	<label for="grade">
		<g:message code="enrollments.grade.label" default="Grade" />	
	</label>
-->	
<ul class="one-to-many">
<g:each in="${enrollmentsInstance?.grade?}" var="g">
    <li><g:link controller="grade" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grade" action="create" params="['enrollments.id': enrollmentsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grade.label', default: 'Grade')])}</g:link>
</li>
</ul>

</div>

<g:if test="${!params.studentId}">
<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="enrollments.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${gradadvising.Student.list()}" optionKey="id" required="" value="${enrollmentsInstance?.student?.id}" class="many-to-one"/>
</div>
</g:if>

<g:if test="${params.studentId}">
<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="enrollments.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id="student" name="student.id" value="${params.studentId}"/>${Student.get(params.studentId)}
	
	</div>
	&nbsp;

</g:if>

	




<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'yrsem', 'error')} required">
	<label for="yrsem">
		<g:message code="enrollments.yrsem.label" default="Yrsem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="yrsem" name="yrsem.id" from="${gradadvising.YearSem.list()}" optionKey="id" required="" value="${enrollmentsInstance?.yrsem?.id}" class="many-to-one"/>
</div>

