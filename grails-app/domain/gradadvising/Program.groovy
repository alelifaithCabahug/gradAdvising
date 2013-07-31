package gradadvising

class Program {

    String programName
	
	static hasMany = [subject:Subject, student:Student]
	
    static constraints = {
		programName(blank:false, unique:true)
    }
	
	static searchable = true
	
	String toString(){
		"${this.programName}"
	}
	
}
