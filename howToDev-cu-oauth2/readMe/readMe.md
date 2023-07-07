# Mocks
Ref to mocks/readMe.md

# API gateway

- `http://127.0.0.1:8002/order` - some Order endpoints.
- https://docs.spring.io/spring-cloud-gateway/docs/4.0.6/reference/html/
- Cors must be configured either on API gateway or resource-server - not on both.

# Resource-server
search for '#' in src/

`http://127.0.0.1:8002/testController` - some test endpoints.
`http://127.0.0.1:8002/order` - some Order endpoints.

# Web-mvc-app

- `server.port = 8005`
- `howToDev-cu-oauth2/mvc-web-app/readMe.md`


# Eureka-discovery-server

- `server.port = 8004`
- `@EnableEurekaServer`
- `http://localhost:8004/` - web console

# Eureka-discovery-client
- `@EnableDiscoveryClient`
- `eureka.client.service-url.defaultZone=http://localhost:8004/eureka` - config for client
- `eureka.instance.instance-id==${spring.cloud.client.hostname}:${spring.application.name}:${spring.application.instance_id:${random.value}}`
- `lb://resource-server` - to address some other eureka client

# Spa-jquery
Created with express generator with ejs view engine.
- `npm install`
- `npm start`
- http://localhost:8007/cu

# Helper
https://docs.spring.io/spring-cloud/docs/current/reference/html/ <br>
Max port: 8007

