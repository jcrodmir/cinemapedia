buildscript {

    repositories {

        google()

        mavenCentral()

    }

    dependencies {

        classpath "com.android.tools.build:gradle:8.10.2"

    }

}

 

allprojects {

    repositories {

        google()

        mavenCentral()

    }

}

 

rootProject.buildDir = "../build"

subprojects {

    project.buildDir = "${rootProject.buildDir}/${project.name}"

}

subprojects {

        afterEvaluate { project ->

            if (project.hasProperty('android')) {

                project.android {

                    if (namespace == null) {

                        namespace project.group

                    }

                }

            }

        }

    }

subprojects {

    project.evaluationDependsOn(":app")

}

 

tasks.register("clean", Delete) {

    delete rootProject.buildDir

}