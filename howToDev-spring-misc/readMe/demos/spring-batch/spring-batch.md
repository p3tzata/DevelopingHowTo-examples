# Depends:

- mocks

# See

### Configuration

- `howToDev-spring-misc/spring-batch/src/main/java/com/example/springbatch/job/service`
- `application.yml`
  

# Action

### Manual test - File without errors.

- trigger:
  - `wget --post-data="" http://localhost:8007/run`
  
- observe:
  - `SELECT * FROM spring_batch.orders`
  - `SELECT * FROM spring_batch.BATCH_JOB_EXECUTION;`

### Manual test - Do some experiments with skipping 

# Help:
`jdbc:mysql://localhost:3008/spring_batch`