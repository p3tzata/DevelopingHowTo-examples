# Depends:
- local installation of graalce



# Action

- trigger: 
  -  in terminal:
     - cd +demo/simpleFibonacciClalculator
     - sdk default java 25.0.1-graalce
     - $JAVA_HOME/bin/javac FibonacciCalculator.java
     - $JAVA_HOME/bin/native-image FibonacciCalculator
     - ./fibonaccicalculator
 


# Help
- https://github.com/PacktPublishing/Supercharge-Your-Applications-with-GraalVM/tree/main/Chapter05
- https://www.youtube.com/watch?v=u7JdwWcZYGQ&list=PLeLcvrwLe185-jKAHsWWF2hvBLyPtTIu3&index=5
