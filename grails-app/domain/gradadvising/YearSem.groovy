package gradadvising

class YearSem {
	String year
	String sem
	
	 static constraints = {
		year(blank:false)
		sem(inList: ["1ST Semester","2ND Semester","Summer"])
    }
	
	String toString(){
	"${this.year} ${sem}"
	}
	
}