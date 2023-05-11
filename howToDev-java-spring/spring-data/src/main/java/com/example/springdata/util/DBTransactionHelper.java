package com.example.springdata.util;

import java.util.function.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.retry.backoff.BackOffPolicy;
import org.springframework.retry.backoff.FixedBackOffPolicy;
import org.springframework.retry.policy.SimpleRetryPolicy;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.retry.support.RetryTemplate;

@Component
public class DBTransactionHelper {

  private final PlatformTransactionManager platformTransactionManager;

  @Autowired
  public DBTransactionHelper(final PlatformTransactionManager platformTransactionManager) {

    this.platformTransactionManager = platformTransactionManager;
  }

  @Transactional
  public void executeInTransaction(final Runnable runnable) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {
      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
    }
    runnable.run();
  }

  public <T> T executeWithRetryInTransactionAndGet(final Supplier<T> supplier, int numRetries, long backoffMs) {

    TransactionTemplate transactionTemplate = new TransactionTemplate(platformTransactionManager);
    RetryTemplate retryTemplate = retryTemplate(numRetries, backoffMs);

    return retryTemplate.execute(retryCtx ->
        transactionTemplate.execute(txStatus -> {

              if (TransactionSynchronizationManager.isActualTransactionActive()) {
                String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
              }

              return supplier.get();

            }
        ));
  }
  @Transactional(propagation = Propagation.REQUIRES_NEW)
  public <T> T executeWithRetryInNewTransactionAndGet(final Supplier<T> supplier, int numRetries, long backoffMs) {

    TransactionTemplate transactionTemplate = new TransactionTemplate(platformTransactionManager);
    RetryTemplate retryTemplate = retryTemplate(numRetries, backoffMs);

    return retryTemplate.execute(retryCtx ->
        transactionTemplate.execute(txStatus -> {

              if (TransactionSynchronizationManager.isActualTransactionActive()) {
                String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
              }

              return supplier.get();

            }
        ));
  }

  public <T> T executeInNewTransactionWithRetryInTransactionAndGet(final Supplier<T> supplier, int numRetries, long backoffMs) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {
      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
    }

    TransactionTemplate transactionTemplate = new TransactionTemplate(platformTransactionManager);
    transactionTemplate.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
    RetryTemplate retryTemplate = retryTemplate(numRetries, backoffMs);

    return retryTemplate.execute(retryCtx ->
        transactionTemplate.execute(txStatus -> {

              if (TransactionSynchronizationManager.isActualTransactionActive()) {
                String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
              }

              return supplier.get();

            }
        ));
  }


  private RetryTemplate retryTemplate(int numRetries, long backofficeMs) {

    final RetryTemplate retryTemplate = new RetryTemplate();
    retryTemplate.setRetryPolicy(new SimpleRetryPolicy(numRetries));
    retryTemplate.setBackOffPolicy(backOffPolicy(backofficeMs));
    retryTemplate.setThrowLastExceptionOnExhausted(true);
    return retryTemplate;
  }

  private BackOffPolicy backOffPolicy(long backofficeMs) {

    final FixedBackOffPolicy fixedBackOffPolicy = new FixedBackOffPolicy();
    fixedBackOffPolicy.setBackOffPeriod(backofficeMs);
    return fixedBackOffPolicy;
  }

}
