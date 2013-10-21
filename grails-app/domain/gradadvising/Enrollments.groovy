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
	
	def getGPA()
	{
		double result = 0;
		double totalLoad = 0;
		def finalResult = 0;

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
		
			if(totalLoad!=0.0)
				finalResult = (result/totalLoad).round(2)
				
			else
				finalResult = "Not Computed"
		
			if(id)
			Enrollments.executeUpdate("update Enrollments e set e.studentGPA='${finalResult}' where e.id='${this?.id}'" )
			
			return finalResult;
	}
	
	
	
	
}