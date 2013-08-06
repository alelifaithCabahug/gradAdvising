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
	
	static belongsTo = [Program]
	
	static hasMany = [enrollments:Enrollments]
	
	
    static constraints = {
		idNumber(blank:false, unique:true)
		studentName(blank:false)
		underGradCourse(blank:false)
		bachelorsDegree(blank:false)
		program(blank:false)
		yearLevel()
		dateEnrolled()
		withGPAof2Above()
		withSuitableBackground()
    }
	
	static searchable = true
	
	String toString(){
	"${this.idNumber} ${studentName}"
	}
}
