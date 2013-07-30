
class YearSem {
	int year
	int sem
	
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