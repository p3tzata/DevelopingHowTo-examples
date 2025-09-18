### Manual test - Method wait for other calls

- trigger:
    - `org/example/usefulWork/Jmx.java`
    - open VisualVM -> Sampler -> CPU -> CPU Samples
- observe:
    - method `Jmx.main()` spends equals total time and CPU time
    - see self time is missing, so this method doesn't wait for external calls.