grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

// uncomment (and adjust settings) to fork the JVM to isolate classpaths
//grails.project.fork = [
//   run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
//]

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.

        // runtime 'mysql:mysql-connector-java:5.1.22'
		runtime 'postgresql:postgresql:9.1-902.jdbc4'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.3"
        runtime ":resources:1.1.6"

        build ":tomcat:$grailsVersion"
<<<<<<< HEAD
//<<<<<<< HEAD
=======
<<<<<<< HEAD
        //runtime ":database-migration:1.3.2"
=======
<<<<<<< HEAD
        //runtime ":database-migration:1.3.2"
=======
<<<<<<< HEAD
        runtime ":database-migration:1.3.2"
=======
<<<<<<< HEAD
>>>>>>> 253f476635b83502485222a22fdab512dd822e6c


//=======
        runtime ":database-migration:1.3.2"
<<<<<<< HEAD
//>>>>>>> 93e1c65e230565b2782da5cab994862b1c7488b9
=======
>>>>>>> 93e1c65e230565b2782da5cab994862b1c7488b9
>>>>>>> 8e53c05e7266a55faf4241e2c153bef9451bfc6e
>>>>>>> 7b9f0dd0c9a0adf407e0a7437eecb6240c45e8dc
>>>>>>> e94955840bc1c28d72e4d37d6a329cbe9ee72ea6
>>>>>>> 253f476635b83502485222a22fdab512dd822e6c
        compile ':cache:1.0.1'
		
		compile ":jquery-ui-extensions:0.5.8"
		compile ":font-awesome-resources:3.0"
    }
}
