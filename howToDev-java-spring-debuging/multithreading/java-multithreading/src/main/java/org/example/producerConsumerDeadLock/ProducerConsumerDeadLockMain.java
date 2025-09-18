package org.example.producerConsumerDeadLock;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class ProducerConsumerDeadLockMain {

  private static Logger log = Logger.getLogger(ProducerConsumerDeadLockMain.class.getName());
  public static List<Integer> listA = new ArrayList<>();
  public static List<Integer> listB = new ArrayList<>();

  public static void main(String[] args) {

    try {
      log.info("Start sleeping");
      Thread.sleep(20000);
      log.info("End sleeping");

      new Producer("_Producer").start();
      new Consumer("_Consumer").start();
    } catch (InterruptedException e) {
      log.severe(e.getMessage());
    }
  }
}