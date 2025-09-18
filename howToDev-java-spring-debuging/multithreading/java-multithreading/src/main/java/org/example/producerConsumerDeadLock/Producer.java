package org.example.producerConsumerDeadLock;

import java.util.Random;
import java.util.logging.Logger;
import org.example.producerConsumerLocks.ProducerConsumerLocksMain;

public class Producer extends Thread {

  private Logger log = Logger.getLogger(Producer.class.getName());

  public Producer(String name) {
    super(name);
  }

  @Override
  public void run() {
    Random r = new Random();
    while (true) {
      synchronized (ProducerConsumerDeadLockMain.listB) {

        synchronized (ProducerConsumerDeadLockMain.listA) {
          work(r);
        }
      }
    }

    // Omitted code
  }

  private void work(Random r) {
    System.out.println("Do work randomVal:" + r);
  }
}

