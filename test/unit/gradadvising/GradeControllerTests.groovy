package gradadvising



import org.junit.*
import grails.test.mixin.*

@TestFor(GradeController)
@Mock(Grade)
class GradeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/grade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradeInstanceList.size() == 0
        assert model.gradeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gradeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradeInstance != null
        assert view == '/grade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/grade/show/1'
        assert controller.flash.message != null
        assert Grade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/grade/list'

        populateValidParams(params)
        def grade = new Grade(params)

        assert grade.save() != null

        params.id = grade.id

        def model = controller.show()

        assert model.gradeInstance == grade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/grade/list'

        populateValidParams(params)
        def grade = new Grade(params)

        assert grade.save() != null

        params.id = grade.id

        def model = controller.edit()

        assert model.gradeInstance == grade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/grade/list'

        response.reset()

        populateValidParams(params)
        def grade = new Grade(params)

        assert grade.save() != null

        // test invalid parameters in update
        params.id = grade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/grade/edit"
        assert model.gradeInstance != null

        grade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/grade/show/$grade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        grade.clearErrors()

        populateValidParams(params)
        params.id = grade.id
        params.version = -1
        controller.update()

        assert view == "/grade/edit"
        assert model.gradeInstance != null
        assert model.gradeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/grade/list'

        response.reset()

        populateValidParams(params)
        def grade = new Grade(params)

        assert grade.save() != null
        assert Grade.count() == 1

        params.id = grade.id

        controller.delete()

        assert Grade.count() == 0
        assert Grade.get(grade.id) == null
        assert response.redirectedUrl == '/grade/list'
    }
}
