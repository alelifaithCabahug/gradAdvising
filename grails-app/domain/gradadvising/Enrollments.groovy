package gradadvising

class Enrollments {
	YearSem yrsem
	Student student
	String yrSemString
	String studentGPA
	
	static belongsTo = [student:Student]
	static hasMany = [grade:Grade, subject:Subject]
	
	static constraints(){
		student(blank:false, unique:true)
		yrsem(blank:false)
		subject(unique:true)
		yrSemString(blank:true)
		studentGPA(blank:true)
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
		
			if(it.getEquivalentGrade() == 0){
				result = result * 1
				totalLoad = totalLoad * 1
			}
			
			else{
				result += (double)it.subject.unitLoad * it.getEquivalentGrade()
				totalLoad += (double)it.subject.unitLoad
			}
			
		}
		return (result/totalLoad).round(2);
		
	}
	
	
	
	
}