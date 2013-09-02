package gradadvising

abstract class StudentBaseController{
	def auth() {
		if(!session.username) {
		def originalRequestParams = [controller:controllerName,action:actionName]
		originalRequestParams.putAll(params)
		session.originalRequestParams = originalRequestParams
		redirect(controller:'student',action:'login')
		return false
	}
	}
}