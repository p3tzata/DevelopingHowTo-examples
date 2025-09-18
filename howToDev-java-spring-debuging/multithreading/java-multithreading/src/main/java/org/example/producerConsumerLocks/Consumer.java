package org.example.producerConsumerLocks;

import java.util.logging.Logger;

public class Consumer extends Thread {

  private Logger log = Logger.getLogger(Consumer.class.getName());

  public Consumer(String name) {
    super(name);
  }

  @Override
  public void run() {
    long totalLogsConsumed = 0;
    for (int i = 0; i < 10_000_000; i++) {

      synchronized (ProducerConsumerLocksMain.list) {
        if (ProducerConsumerLocksMain.list.size() > 0) {
          int x = ProducerConsumerLocksMain.list.get(0);
          ProducerConsumerLocksMain.list.remove(0);
          log.info("Consumer " +
              Thread.currentThread().getName() +
                  " removed value " + x);
          totalLogsConsumed++;
        }
      }

    }
    System.out.println("totalLogsConsumed:" + totalLogsConsumed);
  }
}
