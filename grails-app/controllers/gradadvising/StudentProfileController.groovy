package gradadvising

class StudentProfileController extends StudentBaseController{
	def beforeInterceptor = [action:this.&auth, except:['login','showProfile']]
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def index() { }
	
	def login(){
		if (request.method == "GET") {
			session.sUsername = null
			
			def student = new Student()
		}
		else {
			def student = Student.findBySUsernameAndSPassword(params.sUsername,params.sPassword)
			
			if (student) {
				session.sUsername = student.sUsername
				def redirectParams =session.originalRequestParams?session.originalRequestParams:[controller:'studentProfile', action:"showProfile", id: student.getId()]
				redirect(redirectParams)
		}

		else {
			flash.message = 'Please enter a valid username and password'
			render(view:"login")
			return
		}

		}
	}
	
	def logout = {
		session.sUsername = null
		session.username = null
		
		flash.message = 'Successfully logged out'
		redirect(controller:'studentProfile', action:'login')
	}
	
	def showProfile(Long id) {
		 
		def username = session.sUsername
		def studentInstance = Student.get(id)
		def loggedInStudent = Student.findBySUsername(username)
	
		if(!studentInstance){
			flash.message = "Access Denied! Please log in."
			redirect(action:"login")
			return
		}
	
		if(studentInstance.id == loggedInStudent.id){
			//println studentInstance.studentName
			render(view:"showProfile", model:[studentInstance: studentInstance])
			return
			}	 
    }
}
