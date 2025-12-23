allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// HEMOS QUITADO EL BLOQUE subprojects QUE CAUSABA EL ERROR
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}