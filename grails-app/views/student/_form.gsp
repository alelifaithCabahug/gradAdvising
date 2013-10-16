<%@ page import="gradadvising.Student" %>

<div class="container">  
<div class="row">  

	<div class="span4"> 
			<!-- Username & Password -->

			<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'sUsername', 'error')} ">
				<label for="sUsername">
				<g:message code="student.sUsername.label" default="Username" />
				</label>
				<g:textField name="sUsername" placeholder="name.familyname" value="${studentInstance?.sUsername}"/>
			</div>

			<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'sPassword', 'error')} ">
				<label for="sPassword">
				<g:message code="student.sPassword.label" default="Password" />
				</label>
				<g:field type="password" name="sPassword" placeholder="xxxxxx" value="${studentInstance?.sPassword}"/>
				<!-- <g:textField name="sPassword" input type="password" placeholder="xxxxxx" value="${studentInstance?.sPassword}"/> -->
			</div>
			
			<!-- xxxxx -->
			
			
	</div>

	<div class="span4">
		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'idNumber', 'error')} required">
			<label for="idNumber">
			<g:message code="student.idNumber.label" default="ID Number" />
			<span class="required-indicator">*</span>
			</label>
			<g:textField name="idNumber" required="" placeholder="20xx-xxxx" value="${studentInstance?.idNumber}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentName', 'error')} required">
			<label for="studentName">
			<g:message code="student.studentName.label" default="Student Name" />
			<span class="required-indicator">*</span>
			</label>
			<g:textField name="studentName" required="" placeholder="Dela Cruz, Juan T." value="${studentInstance?.studentName}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'underGradCourse', 'error')} required">
			<label for="underGradCourse">
			<g:message code="student.underGradCourse.label" default="Under Graduate Course" />
			<span class="required-indicator">*</span>
			</label>
			<g:textField name="underGradCourse" required="" placeholder="" value="${studentInstance?.underGradCourse}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'bachelorsDegree', 'error')} required">
			<label for="bachelorsDegree">
			<g:message code="student.bachelorsDegree.label" default="Bachelors Degree" />
			<span class="required-indicator">*</span>
			</label>
			<g:textField name="bachelorsDegree" required="" placeholder="Bachelor of Science" value="${studentInstance?.bachelorsDegree}"/>
		</div>
	</div>

	<div class="span4">
		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'yrsem', 'error')} required">
			<label for="yrsem">
			<g:message code="student.yrsem.label" default="Yrsem" />
			<span class="required-indicator">*</span>
			</label>
			<g:select id="yrsem" name="yrsem.id" from="${gradadvising.YearSem.list()}" optionKey="id" required="" value="${studentInstance?.yrsem?.id}" class="many-to-one"/>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'program', 'error')} required">
			<label for="program">
			<g:message code="student.program.label" default="Program" />
			<span class="required-indicator">*</span>
			</label>
			<g:select id="program" name="program.id" from="${gradadvising.Program.list()}" optionKey="id" required="" value="${studentInstance?.program?.id}" class="many-to-one"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'yearLevel', 'error')} required">
			<label for="yearLevel">
			<g:message code="student.yearLevel.label" default="Year Level" />
			<span class="required-indicator">*</span>
			</label>
			<g:field name="yearLevel" type="number" min="0" max="5" value="${studentInstance.yearLevel}" required=""/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'dateEnrolled', 'error')} required">
			<label for="dateEnrolled">
			<g:message code="student.dateEnrolled.label" default="Date Enrolled" />
			<span class="required-indicator">*</span>
			</label>
			<g:datePicker name="dateEnrolled" precision="day"  value="${studentInstance?.dateEnrolled}"  />
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'withGPAof2Above', 'error')} ">
			<g:message code="student.withGPAof2Above.label" default="2.0 and above GPA" />
			<g:checkBox name="withGPAof2Above" value="${studentInstance?.withGPAof2Above}" />
		</div>

		<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'withSuitableBackground', 'error')} ">
			<g:message code="student.withSuitableBackground.label" default="Suitable Background" /></label>
			<g:checkBox name="withSuitableBackground" value="${studentInstance?.withSuitableBackground}" />
	</div>
	
</div>
</div>

<!-- add enrollments-->

	<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'enrollments', 'error')} ">
		<label for="enrollments">
		<g:message code="student.enrollments.label" default="" />
		</label>
		<ul class="one-to-many">
		<g:each in="${studentInstance?.enrollments?}" var="e">
			<li><g:link controller="enrollments" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
			</g:each>
			<li class="add">
		<g:link controller="enrollments" action="create" params="['student.id': studentInstance?.id]">${message(code: 'Enrollments', args: [message(code: 'enrollments.label', default: 'Enrollments')])}</g:link>
</li>
</ul>
</div>
