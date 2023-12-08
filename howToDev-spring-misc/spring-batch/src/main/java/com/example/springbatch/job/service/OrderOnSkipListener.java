package com.example.springbatch.job.service;

import com.example.springbatch.order.entity.OrderEntity;
import com.example.springbatch.order.model.OrderJsonModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.SkipListener;
import org.springframework.batch.item.file.FlatFileParseException;
import org.springframework.stereotype.Component;

@Component
public class OrderOnSkipListener implements SkipListener<OrderJsonModel, OrderEntity> {

  private static Logger logger = LoggerFactory.getLogger(OrderOnSkipListener.class);

  @Override
  public void onSkipInRead(Throwable t) {

    SkipListener.super.onSkipInRead(t);
    if (t instanceof FlatFileParseException) {
      logger.info("Skipped record in read: " + ((FlatFileParseException) t).getInput());
    }
  }

  @Override
  public void onSkipInProcess(OrderJsonModel item, Throwable t) {

    SkipListener.super.onSkipInProcess(item, t);
    if (t instanceof NullPointerException) {
      logger.info("Skipped record in process: " + item.toString());
    }
  }

  @Override
  public void onSkipInWrite(OrderEntity item, Throwable t) {

    SkipListener.super.onSkipInWrite(item, t);
    if (t instanceof NullPointerException) {
      logger.info("Skipped record in write: " + item.toString());
    }

  }

}