# Depends:
    - `howToDev-microservice-monitoring/microservice`
    - `http://192.168.7.77:8008/actuator/prometheus` - or set other ip in `./prometheus/config.yml`

# See
### Configuration
    - `/howToDev-microservice-monitoring/microservice/src/main/resources/application.yml`
    - `implementation 'io.micrometer:micrometer-registry-prometheus'` in `howToDev-microservice-monitoring/microservice`
    - `./prometheus/config.yml` - prometheus config
    - `com/example/microservice/job/MyJob.java`


### Manual test - see prometheus
    - `http://localhost:9090/targets`
    - `http://localhost:9090/query?g0.expr=jvm_buffer_memory_used_bytes&g0.show_tree=0&g0.tab=graph&g0.range_input=1h&g0.res_type=auto&g0.res_density=medium&g0.display_mode=lines&g0.show_exemplars=0`
    - test with query `jvm_buffer_memory_used_bytes{job='microservice-prometheus'}`
    - test with query `sum(increase(my_job_counter_produced_total[2m]))` 