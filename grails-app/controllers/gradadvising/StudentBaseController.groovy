package gradadvising

abstract class StudentBaseController{
	def auth() {
		if(!session.sUsername) {
		def originalRequestParams = [controller:controllerName,action:actionName]
		originalRequestParams.putAll(params)
		session.originalRequestParams = originalRequestParams
		redirect(controller:'studentProfile',action:'login')
		return false
	}
	}
}