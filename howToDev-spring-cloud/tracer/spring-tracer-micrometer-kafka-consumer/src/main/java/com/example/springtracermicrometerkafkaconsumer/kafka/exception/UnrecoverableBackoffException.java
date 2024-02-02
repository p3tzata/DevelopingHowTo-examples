package com.example.springtracermicrometerkafkaconsumer.kafka.exception;

public class UnrecoverableBackoffException extends RuntimeException {
  public UnrecoverableBackoffException(Throwable t) {
    super("Unable to recover ?????", t);
  }
}
