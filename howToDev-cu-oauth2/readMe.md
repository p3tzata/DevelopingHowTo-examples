# Mocks:
` bash index.bash status`


## Keycloak:
`http://127.0.0.1:8001/auth u:admin,p:123456`
<br><br>
`Some user in MyRealm: u:cu-appuser, p:123456`

To get Access token:<br>
````
curl --location 'http://localhost:8001/auth/realms/MyRealm/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=cu-appuser' \
--data-urlencode 'password=123456' \
--data-urlencode 'client_id=cu-onlyForGetToken' \
--data-urlencode 'client_secret=yjTIs1lZ9007K9dYts2NVrK9piO0sg70' \
--data-urlencode 'scope=cu-photos'
````



## Export DB

Export keycloak db from MySQL Workbench (please use proper version, see it in docker-compose.yml):


- In Data Export window do this:

  - In Object Selection tab:
    - Tables to Export panel:
      - Select the whole auth_service DB
      - Dump Structure and Data
    - Export Options panel:
      - Check To Self-Contained File: <your-repos-dir>/mysql-keycloak-initdb.d/keycloak-dump-oauth2.sql
      - Check Include Create Schema
- Click Advanced Options button and do this:
  - Other panel
    - Uncheck lock tables
  - Inserts panel
    - Check complete-insert
    - Uncheck extended-insert
    - Click Return button
    - Click Start Export

# API gateway

`server.port = 8003`

# Resource-server
`http://127.0.0.1:8002/testController` - some test endpoints.


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

