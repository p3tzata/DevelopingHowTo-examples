### Manual test - Identify thread waits

- trigger:
    - `org/example/producerConsumerNormal/ProducerConsumerWaitsMain.java`
- observe:
    - in VisualVM -> Sampler -> CPU -> CPU Samples
        - `self time` total on both Producer and Consumer is low
        - `java.lang.Object.wait()` is high on both Producer and Consumer, so time is spent for waiting
        - After see either totalLogsConsumed or totalLogsProduced, You will see that either Producer or Consumer is still waiting
          for the other to produce or consume. This I think is the expected behavior. So here only `java.lang.Object.wait()` 
          is on process.
    - in VisualVM -> Profiler -> Threads -> Locks
        - there are lower `waits`.
