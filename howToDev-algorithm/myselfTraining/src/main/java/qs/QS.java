package qs;

import java.util.Arrays;
import util.Util;

public class QS {

  public static void main(String[] args) {

    int[] elements = {1, 20, 4, 55, 6, 7, 3, 9, 4, 99, 56,87,15};
    //int[] elements = {1, 20, 4, 55, 6, 7, 3, 9, 4};
    //int[] elements = {1, 20, 5, 9};
    //int[] elements = {20};

    todoName(0, elements.length - 1, elements);
    System.out.println(Arrays.toString(elements));
    String debugStop = "";

  }

  private static void todoName(int minEl, int maxEl, int[] elements) {

    if (minEl >= maxEl) {
      return;
    }

    int pivotPoint = minEl + ((maxEl - minEl) / 2);

    int pivotVal = elements[pivotPoint];
    Util.swap(pivotPoint, maxEl, elements);
    int i = minEl;
    int j = minEl;

    while (i < maxEl) {

      if (elements[i] > pivotVal) {
        i++;
      }
      else {
        Util.swap(i, j, elements);
        i++;
        j++;
      }

    }

    Util.swap(maxEl, j, elements);

    todoName(minEl,  j - 1, elements);
    todoName(j + 1, maxEl, elements);
  }

}
