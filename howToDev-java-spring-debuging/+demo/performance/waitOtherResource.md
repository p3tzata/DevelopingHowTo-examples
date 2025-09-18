### Manual test - Method wait for other calls

- trigger:
    - `org/example/waitOtherResource/WaitOtherResourceMain.java`
- observe:
    - open VisualVM -> Sampler -> CPU -> CPU Samples 
    - method `WaitOtherResourceMain.main()` spends more time than CPU time, it means that the method is waiting for something.
    - see self time of `WaitOtherResourceMain.main()`, it means that the method itself spends some time, without calls to other methods.