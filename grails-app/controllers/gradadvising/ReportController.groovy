package gradadvising
import groovy.sql.Sql

class ReportController {
	def dataSource
	
    def index(Long id) { 
		 redirect(action: "showEvaluation", id: id)
	}
	
	def showEvaluation(Long id){
		def studentInstance = Student.get(id)
		[studentInstance: studentInstance]
	}
	
	def printEvaluation(){
		def studentInstance = Student.get(params.studentId)
		
		def db = new Sql(dataSource) 
		def result = db.rows("SELECT enrollments.studentgpa,student.under_grad_course,student.bachelors_degree,student.id_number,student.date_enrolled,student.student_name,student.year_level, program.program_name, enrollments.id as enrollment_id, grade.grade, subject.subject_code, subject.subject_description, subject.unit_load, enrollments.yr_sem_string FROM student INNER JOIN program on student.program_id = program.id INNER JOIN enrollments on student.id = enrollments.student_id INNER JOIN year_sem on enrollments.yrsem_id = year_sem.id INNER JOIN grade on enrollments.id = grade.enrollments_id INNER JOIN subject on grade.subject_id = subject.id where student.id = '${studentInstance.id}' order by enrollments.id")
		chain(controller:'jasper',action:'index',model:[data:result],params:params)
	}
}
