package parallelStream;

import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.Test;

public class SampleTest {

  @Test
  void sample(){
    List<Integer> listOfNumbers = Arrays.asList(1, 2, 3, 4);
    listOfNumbers.parallelStream().forEach(number ->
        System.out.println(number + " " + Thread.currentThread().getName())
    );
  }

}
