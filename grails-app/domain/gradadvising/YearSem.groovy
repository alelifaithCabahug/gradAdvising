package gradadvising

class YearSem {
	String year
	String sem
	
	 static constraints = {
		year(blank:false, unique:true)
		sem(inList: ["1ST Semester","2ND Semester","Summer"])
    }
	
	String toString(){
<<<<<<< HEAD
		"{this.year} ${this.sem}"
=======
	"${this.year} ${sem}"
>>>>>>> d2739500b215ec5232e00c397bd868a2f06d3b03
	}
	
}