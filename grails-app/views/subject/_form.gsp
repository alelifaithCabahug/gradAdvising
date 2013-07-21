<%@ page import="gradadvising.Subject" %>



<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'subjectCode', 'error')} required">
	<label for="subjectCode">
		<g:message code="subject.subjectCode.label" default="Subject Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subjectCode" required="" value="${subjectInstance?.subjectCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'subjectDescription', 'error')} required">
	<label for="subjectDescription">
		<g:message code="subject.subjectDescription.label" default="Subject Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subjectDescription" required="" value="${subjectInstance?.subjectDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'unitLoad', 'error')} required">
	<label for="unitLoad">
		<g:message code="subject.unitLoad.label" default="Unit Load" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="unitLoad" type="number" value="${subjectInstance.unitLoad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'isCore', 'error')} ">
	<label for="isCore">
		<g:message code="subject.isCore.label" default="Is Core" />
		
	</label>
	<g:checkBox name="isCore" value="${subjectInstance?.isCore}" />
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'yrsem', 'error')} required">
	<label for="yrsem">
		<g:message code="subject.yrsem.label" default="Yrsem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="yrsem" name="yrsem.id" from="${gradadvising.YearSem.list()}" optionKey="id" required="" value="${subjectInstance?.yrsem?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'program', 'error')} ">
	<label for="program">
		<g:message code="subject.program.label" default="Program" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'student', 'error')} ">
	<label for="student">
		<g:message code="subject.student.label" default="Student" />
		
	</label>
	<g:select name="student" from="${gradadvising.Student.list()}" multiple="multiple" optionKey="id" size="5" value="${subjectInstance?.student*.id}" class="many-to-many"/>
</div>

