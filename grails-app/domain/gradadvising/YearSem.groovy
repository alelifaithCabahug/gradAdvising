package gradadvising

class YearSem {
	String year
	String sem
	
	 static constraints = {
		year(blank:false, unique:true)
		sem(blank:false)
    }
	
}