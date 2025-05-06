# Depends:
- `howToDev-microservice-monitoring/microservice`

# See
### Configuration
- `application.yml`
  - `management.endpoint.health.probes.enabled: true` - enable health probes
  - search for comments in `application.yml` for more details
- `MyInfoContributor.java` - custom info contributor
- `MyActuatorEndpoint.java` - custom actuator endpoint
- `implementation 'io.micrometer:micrometer-registry-prometheus'`
  - this will add prometheus endpoint to actuator


### Integration test


# Action


### Manual test - see endpoints
- description: 

- trigger:
 - `http://127.0.0.1:8008/actuator`
 - `http://127.0.0.1:8008/actuator/prometheus`
- observe:

### Manual test - custom info
- description:
  - see `MyInfoContributor.java`
  - see `management.info.env.enabled`, `info.app.name`

- trigger:
- `http://127.0.0.1:8008/actuator/info`
- observe:

# Help
- endpoints - `http://127.0.0.1:8008/actuator`