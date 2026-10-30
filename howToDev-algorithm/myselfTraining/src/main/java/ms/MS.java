package ms;

import java.util.Arrays;

public class MS {

  public static void main(String[] args) {

    //int[] elements = {10, 2, 30, 7, 4, 5, 1};
    int[] elements = {10, 99, 2, 7, 45};
    int[] temp = new int[elements.length];

    sort(elements, temp, 0, elements.length - 1);

    System.out.println(Arrays.toString(elements));

  }

  private static void sort(int[] elements, int[] temp, int start, int end) {

    if (start >= end) {
      return;
    }

    int mid = start + ((end - start) / 2);

    sort(elements, temp, start, mid);
    sort(elements, temp, mid + 1, end);

    int leftPoint = start;
    int rightPoint = mid + 1;
    int tempIndex = start;

    while (leftPoint < mid + 1 && rightPoint <= end) {
      if (elements[leftPoint] < elements[rightPoint]) {
        temp[tempIndex] = elements[leftPoint];
        leftPoint++;
      }
      else {
        temp[tempIndex] = elements[rightPoint];
        rightPoint++;
      }
      tempIndex++;
    }

    int fulfillFrom;
    int fulfillTo;
    if (leftPoint < mid + 1) {
      fulfillFrom = leftPoint;
      fulfillTo = mid;
    }
    else {
      fulfillFrom = rightPoint;
      fulfillTo = end;
    }

    while (fulfillFrom <= fulfillTo) {
      temp[tempIndex] = elements[fulfillFrom];
      fulfillFrom++;
      tempIndex++;
    }

    int i = start;
    while (i <= end) {
      elements[i] = temp[i];
      i++;
    }

  }

}
