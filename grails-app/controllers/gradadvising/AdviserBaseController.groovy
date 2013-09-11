package gradadvising

abstract class AdviserBaseController extends AdviserBaseController {

	def beforeInterceptor = [action:this.&auth,except:['login']]

    def auth() {
		if(!session.username) {
		def originalRequestParams = [controller:controllerName,action:actionName]
		originalRequestParams.putAll(params)
		session.originalRequestParams = originalRequestParams
		redirect(controller:'adviser',action:'login')
		return false
	}
	}
}
