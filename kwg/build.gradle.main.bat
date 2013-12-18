copy kwg.gradle ..
copy properties.gradle ..
gradlew %1 --build-file="../kwg.gradle" --daemon
del ..\build.gradle
del ..\properties.gradle