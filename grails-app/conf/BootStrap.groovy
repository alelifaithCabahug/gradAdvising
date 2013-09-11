import gradadvising.Adviser
class BootStrap {
		def init = { servletContext ->
			final String BACKUP_ADMIN = 'admin123'
				if (!Adviser.findByUsername(BACKUP_ADMIN)) {
					new Adviser(username:BACKUP_ADMIN,password:'password').save()
				}
			}
		def destroy = {
	}
}class BootStrap {

    def init = { servletContext ->
    }
    def destroy = {
    }
}
