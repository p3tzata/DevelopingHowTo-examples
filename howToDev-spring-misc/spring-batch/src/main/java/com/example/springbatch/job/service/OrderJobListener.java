package com.example.springbatch.job.service;

import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobExecutionListener;
import org.springframework.stereotype.Component;

@Component
public class OrderJobListener implements JobExecutionListener {
  public void beforeJob(JobExecution jobExecution) {
    System.out.println("Before Orders Job!" + jobExecution.getJobId());
    System.out.println("Before Orders Job!" + jobExecution.getJobInstance());
  }

  public void afterJob(JobExecution jobExecution) {
    System.out.println("After Orders Job!" + jobExecution.getJobId());
    System.out.println("After Orders Job!" + jobExecution.getJobInstance());
  }
}