package is;

public class IS {

  public static void main(String[] args) {

    int[] elements = {12, 4, -2, 11, 3, 43, 2, 56, 31, 3, 1};

    for (int i = 1; i < elements.length; i++) {
      int j = i;
      while (j > 0 && elements[j] < elements[j - 1]) {
          swap(elements, j, j - 1);
          j--;
      }
    }


    String string = ";";

  }

  private static void swap(int[] elements, int i, int smallest) {

    int tmp = elements[i];
    elements[i] = elements[smallest];
    elements[smallest] = tmp;
  }

}
