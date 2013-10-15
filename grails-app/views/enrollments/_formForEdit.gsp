<%@ page import="gradadvising.Enrollments" %>
<%@ page import="gradadvising.Student" %>
<%@ page import="gradadvising.Program" %>



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

<!--
<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="enrollments.subject.label" default="Subject" />		
	</label>
	<g:select name="subject" from="${enrollmentsInstance.student.program.subject}" multiple="multiple" optionKey="id" size="5" value="${enrollmentsInstance?.subject*.id}" class="many-to-many"/>
</div>
-->

<div class="fieldcontain ${hasErrors(bean: enrollmentsInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="enrollments.subject.label" default="Subject" />		
	</label>

	<table>
		<tr>
			<td>Select All</td>
			<td><g:checkBox id="select_all" name="select_all" value="" onclick="selectAll();" /></td>
		</tr>

		<g:each in="${enrollmentsInstance.student.program.subject}"  var="subjectInstance">
			<tr>
				<td>${subjectInstance.subjectCode}</td>
				<td>
					<g:if test="${enrollmentsInstance.subject.contains(subjectInstance)}">
						<g:checkBox id="${subjectInstance.id}" name="marked_subjects" value="${subjectInstance.id}" checked="${true}" />
					</g:if>
					<g:else>
						<g:checkBox id="${subjectInstance.id}" name="marked_subjects" value="${subjectInstance.id}" checked="${false}" />
					</g:else>
				</td>
				<br>
			</tr>
		</g:each>
	</table>
</div>


