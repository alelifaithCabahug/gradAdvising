package gradadvising

import org.springframework.dao.DataIntegrityViolationException

class AdviserController extends AdviserBaseController{

	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [adviserInstanceList: Adviser.list(params), adviserInstanceTotal: Adviser.count()]
    }

    def create() {
        [adviserInstance: new Adviser(params)]
    }

    def save() {
        def adviserInstance = new Adviser(params)
        if (!adviserInstance.save(flush: true)) {
            render(view: "create", model: [adviserInstance: adviserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'adviser.label', default: 'Adviser'), adviserInstance.id])
        redirect(action: "show", id: adviserInstance.id)
    }

    def show(Long id) {
        def adviserInstance = Adviser.get(id)
        if (!adviserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adviser.label', default: 'Adviser'), id])
            redirect(action: "list")
            return
        }

        [adviserInstance: adviserInstance]
    }

    def edit(Long id) {
        def adviserInstance = Adviser.get(id)
        if (!adviserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adviser.label', default: 'Adviser'), id])
            redirect(action: "list")
            return
        }

        [adviserInstance: adviserInstance]
    }

    def update(Long id, Long version) {
        def adviserInstance = Adviser.get(id)
        if (!adviserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adviser.label', default: 'Adviser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (adviserInstance.version > version) {
                adviserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'adviser.label', default: 'Adviser')] as Object[],
                          "Another user has updated this Adviser while you were editing")
                render(view: "edit", model: [adviserInstance: adviserInstance])
                return
            }
        }

        adviserInstance.properties = params

        if (!adviserInstance.save(flush: true)) {
            render(view: "edit", model: [adviserInstance: adviserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'adviser.label', default: 'Adviser'), adviserInstance.id])
        redirect(action: "show", id: adviserInstance.id)
    }

    def delete(Long id) {
        def adviserInstance = Adviser.get(id)
        if (!adviserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adviser.label', default: 'Adviser'), id])
            redirect(action: "list")
            return
        }

        try {
            adviserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'adviser.label', default: 'Adviser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'adviser.label', default: 'Adviser'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def login = {
		if (request.method == "GET") {
			session.username = null
			def adviser = new Adviser()
		}
		else {
			def adviser = Adviser.findByUsernameAndPassword(params.username,params.password)
			if (adviser) {
				session.username = adviser.username
				//redirect(controller:'room')
				def redirectParams =session.originalRequestParams?session.originalRequestParams:[controller:'program', action:"index"]
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
		session.username = null
		flash.message = 'Successfully logged out'
		redirect(controller:'adviser', action:'login')
	}

}
