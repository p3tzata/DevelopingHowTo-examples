# Depends:
    - `howToDev-microservice-monitoring/microservice`
    - `http://192.168.7.77:8008/actuator/prometheus` - or set other IP in `./prometheus/config.yml` 
    - `prometheus` - `http://localhost:9090/targets`

# See
### Configuration
    - `./grafana/provisioning/`

### Manual test - see grafana
    - `http://localhost:3000/` - `admin/123456`
    - see JVM dashboard