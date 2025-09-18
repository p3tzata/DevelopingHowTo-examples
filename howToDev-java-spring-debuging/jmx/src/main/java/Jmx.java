import java.util.ArrayList;
import java.util.List;

public class Jmx {

  public static void main(String[] args) {

    System.out.println("Start program");

    while (true) {

      //Do work.
      List<Long> list = new ArrayList<>();
      long dummy = 0;
      for (int i = 0; i < 300_000; i++) {
        dummy = dummy + i;
        list.add(0, dummy);
      }
      System.out.println("Dummy:" + dummy);

    }
  }



}