package org.example.producerConsumerLocks;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
public class ProducerConsumerLocksMain {

  private static Logger log = Logger.getLogger(ProducerConsumerLocksMain.class.getName());
  public static List<Integer> list = new ArrayList<>();

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