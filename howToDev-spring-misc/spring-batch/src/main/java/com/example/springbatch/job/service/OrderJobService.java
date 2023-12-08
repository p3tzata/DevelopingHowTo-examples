package com.example.springbatch.job.service;

import java.time.Instant;
import java.time.LocalTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobExecutionNotRunningException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.launch.JobOperator;
import org.springframework.batch.core.launch.NoSuchJobExecutionException;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class OrderJobService {

  private static Logger logger = LoggerFactory.getLogger(OrderJobService.class);
  private final Job job;
  private final JobLauncher jobLauncher;
  private final JobOperator jobOperator;

  public OrderJobService(@Qualifier("importOrdersJob") Job job, JobLauncher jobLauncher, JobOperator jobOperator) {

    this.job = job;
    this.jobLauncher = jobLauncher;
    this.jobOperator = jobOperator;
  }


  public void startImportOrdersJob()
      throws JobInstanceAlreadyCompleteException, JobExecutionAlreadyRunningException, JobParametersInvalidException, JobRestartException {

    JobParameters jobParameters = new JobParametersBuilder()
        .addLocalTime("key.time", LocalTime.now())
        .toJobParameters();

    jobLauncher.run(job, jobParameters);

    //Without param this job will be executed ones, because there is no identification key
    //jobLauncher.run(job, new JobParameters());
  }



  //@Scheduled(fixedRateString = "${fixedRate.in.milliseconds:20000}")
  public void scheduleImportOrdersJob()
      throws JobInstanceAlreadyCompleteException, JobExecutionAlreadyRunningException, JobParametersInvalidException, JobRestartException {

    logger.info("scheduleImportOrdersJob " + Instant.now());
    JobParameters jobParameters = new JobParametersBuilder()
        .addLocalTime("key.time", LocalTime.now())
        .toJobParameters();
    jobLauncher.run(job, jobParameters);
  }


  @Async
  public void stopImportOrdersJob(long jobExecutionId) throws NoSuchJobExecutionException, JobExecutionNotRunningException {

    jobOperator.stop(jobExecutionId);
  }

}
