package org.example.producerConsumerWaits;

import java.util.logging.Logger;
import java.util.Random;

public class Producer extends Thread {

  private Logger log = Logger.getLogger(org.example.producerConsumerLocks.Producer.class.getName());

  public Producer(String name) {

    super(name);
  }

  @Override
  public void run() {

    try {
      Random r = new Random();
      long totalLogsProduced = 0;
      for (int i = 0; i < 1_000_000; i++) {
        synchronized (ProducerConsumerWaitsMain.list) {
          if (ProducerConsumerWaitsMain.list.size() < 100) {
            int x = r.nextInt();
            ProducerConsumerWaitsMain.list.add(x);
            log.info("Producer " +
                Thread.currentThread().getName() +
                " added value " + x);
            totalLogsProduced++;
            ProducerConsumerWaitsMain.list.notifyAll();
          }
          else {
            ProducerConsumerWaitsMain.list.wait();
          }
        }
      }
      System.out.println("totalLogsProduced:" + totalLogsProduced);
    }
    catch (InterruptedException e) {
      log.severe(e.getMessage());
    }
  }
}
