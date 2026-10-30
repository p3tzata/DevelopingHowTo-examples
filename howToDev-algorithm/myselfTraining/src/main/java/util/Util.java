package util;

public class Util {

  public static void swap(int i, int j, int[] elements) {

    int tmp = elements[i];
    elements[i] = elements[j];
    elements[j] = tmp;
  }

}
