package parallelStream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.jupiter.api.Test;

public class sortTest {

  @Test
  void testSort() {

    Integer[] list = {10, 4, 6, 34, 45,43,342,234,56,234,25,152,32,42,5,16,789,73};

    List<Integer> list1 = Arrays.stream(list).parallel().sorted().collect(Collectors.toList());

    System.out.println(list1);

  }

}
