package com.example.springbatch.job.service;

import org.springframework.batch.core.ExitStatus;
import org.springframework.batch.core.StepExecution;
import org.springframework.batch.core.StepExecutionListener;
import org.springframework.stereotype.Component;

@Component
public class OrderStepListener implements StepExecutionListener {

  @Override
  public void beforeStep(StepExecution stepExecution) {
    System.out.println("Before Import Orders Step!" + stepExecution.getJobExecution().getExecutionContext());
    System.out.println("Before Import Orders Step!" + stepExecution.getExecutionContext());
    System.out.println("Before Import Orders Step!" + stepExecution.getStepName());
    StepExecutionListener.super.beforeStep(stepExecution);
  }

  @Override
  public ExitStatus afterStep(StepExecution stepExecution) {
    System.out.println("After Import Orders Step!" + stepExecution.getJobExecution().getExecutionContext());
    System.out.println("After Import Orders Step!" + stepExecution.getExecutionContext());
    System.out.println("After Import Orders Step!" + stepExecution.getStepName());
    return StepExecutionListener.super.afterStep(stepExecution);

  }
}
