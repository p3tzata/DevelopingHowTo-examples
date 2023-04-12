package parallelStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.junit.jupiter.api.Test;

public class sort {

  @Test
  void testSort() {

    Integer[] list = {10, 4, 6, 34, 45,43,342,234,56,234,25,152,32,42,5,16,789,73};

    List<Integer> list1 = Arrays.stream(list).parallel().sorted().collect(Collectors.toList());

    System.out.println(list1);

  }

}
