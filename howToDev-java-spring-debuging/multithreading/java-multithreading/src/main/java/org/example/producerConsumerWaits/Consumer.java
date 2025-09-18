package org.example.producerConsumerWaits;

import java.util.logging.Logger;

public class Consumer extends Thread {

  private Logger log = Logger.getLogger(org.example.producerConsumerLocks.Consumer.class.getName());

  public Consumer(String name) {

    super(name);
  }

  @Override
  public void run() {

    try {
      long totalLogsConsumed = 0;
      for (int i = 0; i < 1_000_000; i++) {
        synchronized (ProducerConsumerWaitsMain.list) {
          if (ProducerConsumerWaitsMain.list.size() > 0) {
            int x = ProducerConsumerWaitsMain.list.get(0);
            ProducerConsumerWaitsMain.list.remove(0);
            log.info("Consumer " +
                Thread.currentThread().getName() +
                " removed value " + x);
            ProducerConsumerWaitsMain.list.notifyAll();
            totalLogsConsumed++;
          }
          else {
            ProducerConsumerWaitsMain.list.wait();
          }
        }
      }
      System.out.println("totalLogsConsumed:" + totalLogsConsumed);
    }
    catch (InterruptedException e) {
      log.severe(e.getMessage());
    }
  }
}
