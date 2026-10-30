package ss;

import java.util.Arrays;

public class SS {

  public static void main(String[] args) {

    int[] elements = {-9,4, 6, 1, -1, 3, -6, 5};

    for (int i = 0; i < elements.length - 1; i++) {
      int smallest = i;
      for (int j = i + 1; j < elements.length; j++) {

        if (elements[smallest] > elements[j]) {
          smallest = j;
        }

      }
      int tmp = elements[i];
      elements[i] = elements[smallest];
      elements[smallest] = tmp;

    }

    Arrays.stream(elements).forEach(System.out::println);

  }


}
