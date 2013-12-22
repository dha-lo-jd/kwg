copy kwg.gradle ..
if not exist "../properties.gradle" copy properties_.gradle "../properties.gradle"
gradlew %1 --build-file="../kwg.gradle" --daemon
del ../build.gradle