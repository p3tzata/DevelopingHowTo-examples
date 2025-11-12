### Manual test - Identify thread deadlocks

- trigger:
    - `org/example/producerConsumerNormal/ProducerConsumerDeadLockMain.java`

- observe:
    - in VisualVM -> Threads
      - you see warning about deadlock

- trigger:
  - see thread dump in console
    -  ```agsl
        "_Producer" #14 [32891] prio=5 os_prio=31 cpu=47.02ms elapsed=1491.85s tid=0x00007fa37c809600 nid=32891 waiting for monitor entry  [0x0000000305fe9000]
        java.lang.Thread.State: BLOCKED (on object monitor)
        at org.example.producerConsumerDeadLock.Producer.run(Producer.java:22)
          - waiting to lock <0x00000007e99d2720> (a java.util.ArrayList)
          - locked <0x00000007e99d2738> (a java.util.ArrayList)
        
        Locked ownable synchronizers:
        - None
        
        "_Consumer" #15 [33795] prio=5 os_prio=31 cpu=35.00ms elapsed=1491.85s tid=0x00007fa3ac80b200 nid=33795 waiting for monitor entry  [0x00000003060ec000]
        java.lang.Thread.State: BLOCKED (on object monitor)
        at org.example.producerConsumerDeadLock.Consumer.run(Consumer.java:19)
          - waiting to lock <0x00000007e99d2738> (a java.util.ArrayList)
          - locked <0x00000007e99d2720> (a java.util.ArrayList)
        
        Locked ownable synchronizers:
        - None
        ```
    
  - get thread dump and load into fastThread for analysis
