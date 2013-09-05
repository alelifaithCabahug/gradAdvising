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
	
	static belongsTo = [Student, Program]
	static hasMany = [student:Student, program:Program]
	
	static searchable = true
	
	String toString(){
	"${this.subjectCode}"

	}
}
