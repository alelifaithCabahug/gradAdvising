package gradadvising

class Enrollments {
	YearSem yrsem
	Student student
	static belongsTo = [student:Student]
	
	//to add YearSem + Subject at the same time
	static hasMany = [subject:Subject]
	
	static constraints(){
		student(unique:true)
		yrsem()
	}
	
	String toString(){
		"enrollment: ${student.studentName} ${this.yrsem}"
	}
	
}