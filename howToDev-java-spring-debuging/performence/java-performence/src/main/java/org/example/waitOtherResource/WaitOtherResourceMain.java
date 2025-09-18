package org.example.waitOtherResource;

import java.util.ArrayList;
import java.util.List;

public class WaitOtherResourceMain {

  public static void main(String[] args) throws InterruptedException {

    System.out.println("Start program");

    while (true) {
      System.out.println("Sleeping");
      Thread.sleep(5_000);
      System.out.println("End Sleeping");

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