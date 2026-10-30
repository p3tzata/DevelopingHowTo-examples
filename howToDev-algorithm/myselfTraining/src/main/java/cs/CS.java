package cs;

import java.util.Arrays;

public class CS {

  public static void main(String[] args) {

    //int[] elements = {10, 2, 2, 5, 7, 7, 7};
    int[] elements = {10, 1, 2, 5, 1};

    int max = elements[0];
    for (int i = 1; i < elements.length; i++) {
      if (elements[i] > max) {
        max = elements[i];
      }
    }

    int[] countArr = new int[max + 1];

    for (int i = 0; i < elements.length; i++) {
      countArr[elements[i]] = countArr[elements[i]] + 1;
    }

    System.out.println(Arrays.toString(countArr));

    int[] accArr = new int[countArr.length];

    for (int i = 1; i < countArr.length; i++) {
      accArr[i] = accArr[i - 1] + countArr[i];
    }

    System.out.println(Arrays.toString(accArr));

    int[] elementsOrdered = new int[elements.length];

    for (int i = elements.length - 1; i > -1; i--) {
      int j = --accArr[elements[i]];
      elementsOrdered[j] =elements[i];

    }
    System.out.println(Arrays.toString(elementsOrdered));

  }

}
