package gradadvising

class StudentProfileController extends StudentBaseController{
	def beforeInterceptor = [action:this.&auth, except:['login']]
	
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
		flash.message = 'Successfully logged out'
		redirect(controller:'studentProfile', action:'login')
	}
}
