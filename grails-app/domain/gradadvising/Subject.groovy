package gradadvising

class Subject {

<<<<<<< HEAD
   String subjectCode
=======
	String subjectCode
>>>>>>> fad0e7353e73dfe3aa68e11b00caba096c98cdf1
	String subjectDescription
	int unitLoad
	boolean isCore
	YearSem yrsem
	
    static constraints = {
		subjectCode(blank:false, unique:true)
		subjectDescription(blank:false)
		unitLoad()
		isCore()
		yrsem()
    }
	
	static belongsTo = [Student, Program]
	static hasMany = [student:Student, program:Program]
	
	static searchable = true
	
	String toString(){
	"${this.subjectCode}"
	}
<<<<<<< HEAD
=======


>>>>>>> fad0e7353e73dfe3aa68e11b00caba096c98cdf1
}
