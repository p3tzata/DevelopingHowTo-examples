package searchStr;

public class naiveSearchStr {

  public static void main(String[] args) {

    String text = "Tsentence";
    String pattern = "sentence";

    for (int i = 0; i < text.length() - pattern.length()+ 1; i++) {

      int j = 0;
      while (j < pattern.length()) {

        if (text.charAt(i) == pattern.charAt(j)) {
          j++;
          i++;
        }
        else {
          break;
        }
      }
      if (j == pattern.length()) {
        System.out.println("Found at index " + (i-pattern.length()));
        break;
      }

    }


  }

}
