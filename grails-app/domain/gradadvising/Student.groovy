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
	String username
	String password
	
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
		username(unique:true, blank:false)
		password(blank:false)
    }
	
	static searchable = true
	
	String toString(){
	"${this.idNumber} ${studentName}"
	}
}
