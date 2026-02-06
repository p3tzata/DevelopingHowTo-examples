# Dependencies

- `howToDev-Graal/spring-native-gradle-simple`

# Configuration

- build.gradle
    - plugin: org.graalvm.buildtools.native
    - `graalvmNative` section

# Actions - Compile & Run

- `./gradlew nativeCompile`
- `./build/native/nativeCompile/myNativeApp`
- `GET http://localhost:8010/api`

# Actions - get heap dump
- find PID of `myNativeApp`
- `kill -SIGUSR1 ${PID}`
- see `{someName}.hprof` in the working directory of myNativeApp (spring-native-gradle-simple)
- don't commit this `.hprof`

# Actions - identify reflection
- /gradlew build
- 

# Help

see restCall.http