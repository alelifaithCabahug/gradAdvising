package gradadvising

class Enrollments {
	YearSem yrsem
	Student student
	
	static belongsTo = [student:Student]
	//static hasMany = [grade:Grade]
	
	static constraints(){
		student(unique:true)
		yrsem()
	}
	
	String toString(){
		"enrollment: ${student.studentName} ${this.yrsem}"
	}
	
	//getGPA to be implemented
