### Manual test - Identify memory issue

- trigger:
  - org/example/memoryIssue/MemoryIssueMain.java

- observe:
    - in VisualVM -> Sampler -> Memory
        - sort desc by `live bytes`
        - sort desc by `live objects`
    - see MyClass.class cause the problem
- trigger:
  - make heapdump
  - load heapdump file into VisulaVM
- observe:
  - see `Classes by numbers of instances`
  - see `Classes by size of instances`
  - switch to `Objects` view 
    - order by size or count
    - view who hold the reference to MyClass.class
      - `static list in class org.example.memoryIssue.MemoryIssueMain : MemoryIssueMain`