package org.example.producerConsumerDeadLock;

import java.util.logging.Logger;

public class Consumer extends Thread {

  private Logger log = Logger.getLogger(Consumer.class.getName());

  public Consumer(String name) {
    super(name);
  }

  @Override
  public void run() {
    while (true) {
      synchronized (ProducerConsumerDeadLockMain.listA) {

        synchronized (ProducerConsumerDeadLockMain.listB) {
          work();
        }
      }
    }
  }

  private void work() {

    System.out.println("Do work");

  }
}
