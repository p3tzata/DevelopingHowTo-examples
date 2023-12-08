package com.example.springbatch.order.controller;

import com.example.springbatch.job.service.OrderJobService;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobExecutionNotRunningException;
import org.springframework.batch.core.launch.NoSuchJobExecutionException;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderJobController {
  private final OrderJobService jobService;
  public OrderJobController(OrderJobService jobService) {
    this.jobService = jobService;
  }

  @PostMapping("/run")
  public ResponseEntity<Void> runJob() throws JobInstanceAlreadyCompleteException, JobExecutionAlreadyRunningException, JobParametersInvalidException, JobRestartException {
    jobService.startImportOrdersJob();
    return ResponseEntity
        .noContent()
        .build();
  }

  @PostMapping("/stop/{jobExecutionId}")
  public void stopImportRecipesJob(@PathVariable long jobExecutionId) throws JobInstanceAlreadyCompleteException, JobExecutionAlreadyRunningException, JobParametersInvalidException, NoSuchJobExecutionException, JobExecutionNotRunningException, JobRestartException {
    jobService.stopImportOrdersJob(jobExecutionId);
  }

}
