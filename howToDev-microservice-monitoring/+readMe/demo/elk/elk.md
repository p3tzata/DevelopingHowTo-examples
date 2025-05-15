# Depends:
    - `howToDev-microservice-monitoring/microservice-elk`
    - mocks 

# See
### Configuration
    - `./logstash/pipeline/logstash.conf` - logstash config
    - `microservice-elk/src/main/resources/logback-spring.xml`
 

### Manual test - see urls
    - http://localhost:9200/_cat/indices - elasticsearch indeces, will be created logback-*
    - http://localhost:9600/_node/stats/pipelines - logstash stats
    - http://localhost:5601/` - kibana
    - http://localhost:5601/app/management/data/index_management/indices - kibana index management
    
### Manual test - kibana
    - Analytics -> Discover -> create data view 
        - index pattern: logback-*

