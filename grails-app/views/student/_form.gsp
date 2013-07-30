<%@ page import="gradadvising.Student" %>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'idNumber', 'error')} required">
	<label for="idNumber">
		<g:message code="student.idNumber.label" default="ID Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idNumber" required="" placeholder="20xx-xxxx" value="${studentInstance?.idNumber}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentName', 'error')} required">
	<label for="studentName">
		<g:message code="student.studentName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="studentName" required="" placeholder="Doe, John A." value="${studentInstance?.studentName}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'underGradCourse', 'error')} required">
	<label for="underGradCourse">
		<g:message code="student.underGradCourse.label" default="Under Grad Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="underGradCourse" required="" value="${studentInstance?.underGradCourse}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'bachelorsDegree', 'error')} required">
	<label for="bachelorsDegree">
		<g:message code="student.bachelorsDegree.label" default="Bachelors Degree" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bachelorsDegree" required="" value="${studentInstance?.bachelorsDegree}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'program', 'error')} required">
	<label for="program">
		<g:message code="student.program.label" default="Program" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="program" name="program.id" from="${gradadvising.Program.list()}" optionKey="id" required="" value="${studentInstance?.program?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'dateEnrolled', 'error')} required">
	<label for="dateEnrolled">
		<g:message code="student.dateEnrolled.label" default="Date Enrolled" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateEnrolled" precision="day"  value="${studentInstance?.dateEnrolled}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'withGPAof2Above', 'error')} ">
	<label for="withGPAof2Above">
		<g:message code="student.withGPAof2Above.label" default="GPA of Above 2.0" />
	</label>
	<g:checkBox name="withGPAof2Above" value="${studentInstance?.withGPAof2Above}" />
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'withSuitableBackground', 'error')} ">
	<label for="withSuitableBackground">
		<g:message code="student.withSuitableBackground.label" default="Suitable Background" />
	</label>
	<g:checkBox name="withSuitableBackground" value="${studentInstance?.withSuitableBackground}" />
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'enrollments', 'error')} ">
	<label for="enrollments">
		<g:message code="student.enrollments.label" default="Subjects to be Enrolled" />
	</label>
	<g:select name="enrollments" from="${gradadvising.Enrollments.list()}" multiple="multiple" optionKey="id" size="5" value="${studentInstance?.enrollments*.id}" class="many-to-many"/>
</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'yrsem', 'error')} required">
	<label for="yrsem">
		<g:message code="student.yrsem.label" default="Year & Semester" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="yrsem" name="yrsem.id" from="${gradadvising.YearSem.list()}" optionKey="id" required="" value="${studentInstance?.yrsem?.id}" class="many-to-one"/>
</div>
