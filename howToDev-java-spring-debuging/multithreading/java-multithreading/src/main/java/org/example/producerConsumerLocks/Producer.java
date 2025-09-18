package org.example.producerConsumerLocks;

import java.util.Random;
import java.util.logging.Logger;

public class Producer extends Thread {

  private Logger log = Logger.getLogger(Producer.class.getName());

  public Producer(String name) {
    super(name);
  }

  @Override
  public void run() {
    Random r = new Random();
    long totalLogsProduced = 0;
    for (int i = 0; i < 10_000_000; i++) {
      synchronized (ProducerConsumerLocksMain.list) {
        if (ProducerConsumerLocksMain.list.size() < 100) {
          int x = r.nextInt();
          ProducerConsumerLocksMain.list.add(x);
          log.info("Producer " +
              Thread.currentThread().getName() +
              " added value " + x);
          totalLogsProduced++;
        }
      }
    }
    System.out.println("totalLogsProduced:" + totalLogsProduced);
  }
}
