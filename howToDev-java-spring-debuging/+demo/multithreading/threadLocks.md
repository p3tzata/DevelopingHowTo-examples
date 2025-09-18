### Manual test - Identify thread locks

- trigger:
  - `org/example/producerConsumerNormal/ProducerConsumerLocksMain.java`
- observe:
  - in VisualVM -> Sampler -> CPU -> CPU Samples    
    - self time total time is much bigger than CPU time, it means that the method is waiting itself, which means thread lock.


### Manual test - Identify count of thread locks and which thread is holding the lock

- trigger:
  - `org/example/producerConsumerNormal/ProducerConsumerLocksMain.java`
- observe:
  - in VisualVM -> Profiler -> Locks 
    - `was blocked by`, `held` you see java.util.ArrayList is holding the lock because of 
    `synchronized(ProducerConsumerLocksMain.list)` 
    - `waits` is number of times thread was waiting for lock.
