package com.example.springbatch.job.service;

import com.example.springbatch.order.entity.OrderEntity;
import com.example.springbatch.order.model.OrderJsonModel;
import com.example.springbatch.order.reposotiry.OrderRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.batch.core.step.skip.AlwaysSkipItemSkipPolicy;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.file.FlatFileParseException;
import org.springframework.batch.item.file.builder.FlatFileItemReaderBuilder;
import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.batch.item.file.transform.FieldSet;
import org.springframework.batch.item.json.JacksonJsonObjectReader;
import org.springframework.batch.item.json.builder.JsonItemReaderBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
//@EnableBatchProcessing
public class OrderJob {

  private final OrderRepository orderRepository;
  private final OrderJobListener jobListener;
  private final OrderStepListener stepListener;
  private final OrderOnSkipListener skipListener;

  public OrderJob(OrderRepository orderRepository, OrderJobListener jobListener, OrderStepListener stepListener,
      OrderOnSkipListener skipListener) {

    this.orderRepository = orderRepository;
    this.jobListener = jobListener;
    this.stepListener = stepListener;
    this.skipListener = skipListener;
  }

  @Bean(name = "importOrdersJob")
  public Job importOrdersJob(JobRepository jobRepository, Step importOrdersStep) {

    return new JobBuilder("importOrdersJob", jobRepository)
        .incrementer(new RunIdIncrementer())
        .start(importOrdersStep)
        .listener(jobListener)
//                .next(updateDateCreatedTasklet)
        .build();
  }

  @Bean
  protected Step importOrdersStep(JobRepository jobRepository, PlatformTransactionManager transactionManager)
      throws InterruptedException {

    return new StepBuilder("importOrdersStep", jobRepository)
        .<OrderJsonModel, OrderEntity>chunk(3, transactionManager)

        .reader(jsonReader())
        .processor(processor())
        .writer(writer())
        .faultTolerant()
//        .skip(FlatFileParseException.class)
 //               .skipLimit(1)
//        .skipPolicy(new AlwaysSkipItemSkipPolicy())
        .listener(skipListener)
        .retryLimit(1)
        .retry(FlatFileParseException.class)
//                .listener(skipListener)
//                .listener(stepListener)
        .build();
  }

  @Bean
  public ItemReader<OrderJsonModel> jsonReader() {

    return new JsonItemReaderBuilder<OrderJsonModel>()
        .jsonObjectReader(new JacksonJsonObjectReader<>(
            new ObjectMapper().registerModule(new JavaTimeModule()), OrderJsonModel.class))
        .resource(new ClassPathResource("orders.json"))
        .name("ordersJsonItemReader")
        .build();
  }

  @Bean
  public ItemProcessor<OrderJsonModel, OrderEntity> processor() {

    return item -> OrderEntity.builder()
        .orderId(item.getOrderId())
        .orderCode(item.getOrderCode()).build();
  }

  @Bean
  public ItemWriter<OrderEntity> writer() {

    return orderRepository::saveAll;
  }

}
