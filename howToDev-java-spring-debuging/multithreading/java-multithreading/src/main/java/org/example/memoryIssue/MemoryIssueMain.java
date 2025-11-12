package org.example.memoryIssue;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class MemoryIssueMain {

  private static Logger log = Logger.getLogger(MemoryIssueMain.class.getName());
  public static List<MyClass> list = new ArrayList();

  public static void main(String[] args) throws InterruptedException

    try {
      log.info("Start memory issue simulation");

      for (int i = 0; i < 3_000_000; i++) {
        list.add(new MyClass("123", "testName"));
      }
      while (true) {
        Thread.sleep(1000L);
      }

    }
    catch (OutOfMemoryError e) {
      log.severe("OutOfMemoryError occurred: " + e.getMessage());
    }
  }

}
