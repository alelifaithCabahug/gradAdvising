package gradadvising

class Enrollments {
	YearSem yrsem
	Student student
	
	static belongsTo = [student:Student]
	static hasMany = [grade:Grade]
	
	static constraints(){
		student(blank:false, unique:true)
		yrsem(blank:false)
		subject(unique:true)
	}
	
	String toString(){
		"enrollment: ${student.studentName} ${this.yrsem}"
	}
	
	double getGPA()
	{
		double result = 0;
		double totalLoad = 0;
		grade.each()
		{
			result = it.subject.unitLoad * it.getEquivalentGrade()
			totalLoad += it.subject.unitLoad
		}
		return result/totalLoad;
	}
}