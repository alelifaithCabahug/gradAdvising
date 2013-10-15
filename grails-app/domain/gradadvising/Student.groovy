package gradadvising

class Student{	
	String studentName
	String idNumber
	String underGradCourse
	Date dateEnrolled
	Program program
	YearSem yrsem
	String bachelorsDegree
	boolean withGPAof2Above
	boolean withSuitableBackground
	int yearLevel
	
	//attributes for login
	String sUsername
	String sPassword
	
	static belongsTo = [Program]
	
	static hasMany = [enrollments:Enrollments]
	
	
    static constraints = {
		idNumber(blank:false, unique:true)
		studentName(blank:false)
		underGradCourse(blank:false)
		bachelorsDegree(blank:false)
		program(blank:false)
		yearLevel(min:0, max:5)
		dateEnrolled()
		withGPAof2Above()
		withSuitableBackground()
	
		sUsername(unique:true, blank:true)
		sPassword(blank:true)
    }
	
	static searchable = true
	
	String toString(){
	"${this.idNumber} ${studentName}"
	}
	
	def getNotEnrolledYearSem(){
		
		def enrolledSem = this.enrollments.yrsem
		def yrSemList = YearSem.list()
		def notEnrolledSem = yrSemList.id-enrolledSem.id
		def result = notEnrolledSem.collect{YearSem.get(it)}
		return result
	}
	
	def getSubjectWithNoGrades(){

		//def subjectsGrade = Grade.findAll("from Grade as g where g.enrollments.student.id=:studentId", [studentId:this.id])
		//def sub = subjectsGrade.subject
		//println " try ${sub}"
		def subjectsWithGrade = (enrollments.grade.subject).flatten()
		
		def studentSubjects = (program.subject)

		def subjectsWithNoGrade = studentSubjects.id-subjectsWithGrade.id
		def result = subjectsWithNoGrade.collect{Subject.get(it)}
		return result
	}
}
