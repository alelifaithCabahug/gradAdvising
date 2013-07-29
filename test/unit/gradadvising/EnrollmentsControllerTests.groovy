package gradadvising



import org.junit.*
import grails.test.mixin.*

@TestFor(EnrollmentsController)
@Mock(Enrollments)
class EnrollmentsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/enrollments/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.enrollmentsInstanceList.size() == 0
        assert model.enrollmentsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.enrollmentsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.enrollmentsInstance != null
        assert view == '/enrollments/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/enrollments/show/1'
        assert controller.flash.message != null
        assert Enrollments.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/enrollments/list'

        populateValidParams(params)
        def enrollments = new Enrollments(params)

        assert enrollments.save() != null

        params.id = enrollments.id

        def model = controller.show()

        assert model.enrollmentsInstance == enrollments
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/enrollments/list'

        populateValidParams(params)
        def enrollments = new Enrollments(params)

        assert enrollments.save() != null

        params.id = enrollments.id

        def model = controller.edit()

        assert model.enrollmentsInstance == enrollments
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/enrollments/list'

        response.reset()

        populateValidParams(params)
        def enrollments = new Enrollments(params)

        assert enrollments.save() != null

        // test invalid parameters in update
        params.id = enrollments.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/enrollments/edit"
        assert model.enrollmentsInstance != null

        enrollments.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/enrollments/show/$enrollments.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        enrollments.clearErrors()

        populateValidParams(params)
        params.id = enrollments.id
        params.version = -1
        controller.update()

        assert view == "/enrollments/edit"
        assert model.enrollmentsInstance != null
        assert model.enrollmentsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/enrollments/list'

        response.reset()

        populateValidParams(params)
        def enrollments = new Enrollments(params)

        assert enrollments.save() != null
        assert Enrollments.count() == 1

        params.id = enrollments.id

        controller.delete()

        assert Enrollments.count() == 0
        assert Enrollments.get(enrollments.id) == null
        assert response.redirectedUrl == '/enrollments/list'
    }
}
