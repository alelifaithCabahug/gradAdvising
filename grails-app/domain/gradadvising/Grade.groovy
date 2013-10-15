package gradadvising

class Grade {

	Subject subject
	Enrollments enrollments
	String grade

	static belongsTo = [enrollments:Enrollments]
	
	static constraints = {
		enrollments(blank:false)
		grade(inList:['1.0','1.25','1.5','1.75','2.0','2.25','2.5','2.75','3.0','5.0', 'INC', 'DROPPED', 'WDRW'], blank:false)
	}
	
	String toString(){
		return grade
	}
	
	double getEquivalentGrade()
	{
		if( grade == "1.0")
			return 1.0;
		
		else if( grade == "1.25")
			return 1.25;
		
		else if( grade == "1.75")
			return 1.75;
			
		else if( grade == "2.0")
			return 2.0;
			
		else if( grade == "2.25")
			return 2.25;
			
		else if( grade == "2.5")
			return 2.5;
			
		else if( grade == "2.75")
			return 2.75;
			
		else if( grade == "3.0")
			return 3.0;
		
		else if ( grade == "WDRW")
			return 0.0;

		else
			return 5.0;
		}
		
		
		
}
