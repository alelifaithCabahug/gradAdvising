package gradadvising

abstract class AdviserBaseController{

    def auth() {
		if(!session.username) {
		def originalRequestParams = [controller:controllerName,action:actionName]
		originalRequestParams.putAll(params)
		session.originalRequestParams = originalRequestParams
		redirect(controller:'adviser',action:'login')
		return false
		}
		if(!session.username && session.sUsername) {
		session.sUsername = null
		redirect(controller:'adviser',action:'login')
		return false
		}
	}
}
