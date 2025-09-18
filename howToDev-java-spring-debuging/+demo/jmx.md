### Manual test - connect visualVm to JMX

- trigger:
  - start jar with JMX options:
    ```agsl
    java -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.port=9010 \
    -Dcom.sun.management.jmxremote.rmi.port=9010 \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Djava.rmi.server.hostname=0.0.0.0 \ 
    -jar jmx-1.0-SNAPSHOT.jar
    ```
  - add JMX connection in VisualVM -> File -> Add JMX Connection -> localhost:9010

### Manual test - start jar with gradle task with JMX options

- observe:
  - `jmx/build.gradle`
- trigger:
    - start program with IDE
      ```
    - add JMX connection in VisualVM -> File -> Add JMX Connection -> localhost:9010
