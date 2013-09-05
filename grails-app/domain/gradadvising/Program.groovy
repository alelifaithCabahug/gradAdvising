package gradadvising

class Program {

    String programName
	int numberOfYears
	
	static hasMany = [subject:Subject, student:Student]
	
    static constraints = {
		programName(blank:false, unique:true)
		numberOfYears(min:1, max:5)
    }
	
	static searchable = true
	
	String toString(){
		"${this.programName}"
	}
	
}
