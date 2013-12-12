copy build.gradle ..
copy gradle.properties ..
gradlew eclipse --project-dir="../"
del ..\build.gradle
del ..\gradle.properties