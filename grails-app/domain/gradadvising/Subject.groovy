package gradadvising

class Subject {

   String subjectCode
	String subjectDescription
	int unitLoad
	boolean isCore
	YearSem yrsem
	
	
    static constraints = {
		subjectCode(blank:false, unique:true)
		subjectDescription(blank:false)
		unitLoad(min:1, max:6)
		isCore()
		yrsem()
    }
	
	
	//static hasMany = [student:Student]
	
	static searchable = true
	
	String toString(){
	"${this.subjectCode}"
	}
	
	
	
	Grade findSubjectGrade(Long enrollmentId){
		def gradeResult = Grade.find("from Grade as g where g.subject.id=:subjectId and g.enrollments.id=:enrollmentId", [subjectId: (Long)(this.id),enrollmentId: (Long) enrollmentId])
	}
}
