package gradadvising

abstract class StudentBaseController{
	def auth() {
		if(!session.sUsername) {
		//def originalRequestParams = [controller:controllerName,action:actionName]
		//originalRequestParams.putAll(params)
		session.originalRequestParams = null
		redirect(controller:'studentProfile',action:'login')
		return false
		}
	
		if(!session.sUsername && session.username) {
		session.username = null
		redirect(controller:'studentProfile',action:'login')
		return false
		}
	}
}