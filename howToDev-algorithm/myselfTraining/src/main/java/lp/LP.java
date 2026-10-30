package lp;

public class LP {

  public static void main(String[] args) {

    String text = "gge";
    searchLP(text);

  }

  private static void searchLP(String text) {

    int length = text.length();
    int globalMaxLeng = 0;
    int operation = 0;

    for (int i = 0; i < length - 1; i++) {
      int r = i + 1;

      while (r < length) {
        int l = i;
        int maxLeng = 0;
        while (r < length && text.charAt(l) == text.charAt(r)) {
        //while (r < length && maxLeng < (r-l) && text.charAt(l) == text.charAt(r)) {
          operation++;
          maxLeng++;
          r++;
          l++;

        }
        if (maxLeng == 0) {
          operation++;
          r++;
        }

        globalMaxLeng = Math.max(globalMaxLeng, maxLeng);
      }

    }

    System.out.println("globalMaxLeng:"+globalMaxLeng);
    System.out.println("operation:"+operation);

  }

}
