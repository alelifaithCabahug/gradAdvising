package gradadvising

class YearSem {
	int year
	int sem
	
	static constraints = {
		year(blank:false, min:2000, max:2050)
		sem(blank:false, min:1, max:3)
    }
	
	public YearSem(int y, int s)
	{
		year = y
		sem = s
	}
	
	public String toString()
	{
	    StringBuffer s = new StringBuffer(Integer.toString(year) + "-" +Integer.toString(year+1));
		switch(sem)
		{
			case 1: 
			   s.append(" Sem 1")
			   break
			case 2:
			   s.append(" Sem 2")
			   break
			case 3:
			   s.append(" Summer")
			   break;
			   
		}
		
		return s.toString();
	}
}