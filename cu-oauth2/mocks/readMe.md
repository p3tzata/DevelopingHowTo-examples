## Mocks:
` bash index.bash status`


## Keycloak:
`http://127.0.0.1:8001/auth u:admin,p:123456`

Export keycloak db from MySQL Workbench:

- In Data Export window do this:

  - In Object Selection tab:
    - Tables to Export panel:
      - Select the whole auth_service DB
      - Dump Structure and Data
    - Export Options panel:
      - Check To Self-Contained File: <your-repos-dir>/mysql-keycloak-initdb.d/keycloak-dump.sql
      - Check Include Create Schema
- Click Advanced Options button and do this:
  - Other panel
    - Uncheck lock tables
  - Inserts panel
    - Check complete-insert
    - Uncheck extended-insert
    - Click Return button
    - Click Start Export
