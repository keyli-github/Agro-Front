allprojects {
    repositories {
        google()
        mavenCentral()
    }
    buildDir = File(rootProject.projectDir, "../build/${project.name}")
}

// HEMOS QUITADO EL BLOQUE subprojects QUE CAUSABA EL ERROR
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
