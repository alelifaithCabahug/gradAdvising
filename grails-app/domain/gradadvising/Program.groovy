package gradadvising

class Program {

    String programName
	int numberOfYears
	
	static hasMany = [subject:Subject, student:Student]
	
    static constraints = {
		programName(blank:false, unique:true)
		numberOfYears(blank:false)
    }
	
	static searchable = true
	
	String toString(){
		"${this.programName}"
	}
	
}
