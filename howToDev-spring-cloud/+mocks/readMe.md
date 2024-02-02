## Keycloak:
`http://127.0.0.1:8002/auth u:admin,p:123456`
<br><br>
`Some user in MyRealm: u:my-appuser, p:123456`

To get Access token:<br>
````
curl --location 'http://localhost:8002/auth/realms/MyRealm/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=my-appuser' \
--data-urlencode 'password=123456' \
--data-urlencode 'client_id=my-developing-help-service' \
--data-urlencode 'client_secret=PBd6UqpDakkLP6duVQfURWKdGNRdzBsj'
````



## Export DB

Export keycloak db from MySQL Workbench (please use proper version, see it in docker-compose.yml):


- In Data Export window do this:

    - In Object Selection tab:
        - Tables to Export panel:
            - Select the whole auth_service DB
            - Dump Structure and Data
        - Export Options panel:
            - Check To Self-Contained File: <your-repos-dir>/mysql-keycloak-initdb.d/keycloak-dump-spring-cloud.sql
            - Check Include Create Schema
- Click Advanced Options button and do this:
    - Other panel
        - Uncheck lock tables
    - Inserts panel
        - Check complete-insert
        - Uncheck extended-insert
        - Click Return button
        - Click Start Export




# Mocks:
- Install on the host kafka. `brew install kafka` only to use as client. (kafka-console-consumer and etc.)
- Edit env in mocks-config.bash
- `./mocks.bash help` for help.
- `./mocks.bash kafka listTopics` for test of connectivity.
