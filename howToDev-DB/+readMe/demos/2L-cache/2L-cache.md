# Depends:
- mocks
- `howToDev-DB/spring-hibernate-JPA-cache`

# See
### Configuration
- `build.gradle`
- `@Cachable`
- `application.yml`



# Action



### Manual test - Second Level Cache 
- description:
on first call db query is executed. On every afterward data is getting from cache

- trigger:
    - post request to create entity
    - get request to retrieve entity

- observe:
    - sql query in console of `howToDev-DB/spring-hibernate-JPA-cache`
    
- trigger:
    - get request to retrieve entity  

- observe:
    - no sql query in console of `howToDev-DB/spring-hibernate-JPA-cache`

# Help

```bash
curl -v --location 'http://localhost:8013/order/cachable' \
--header 'Content-Type: application/json' \
--data '{
    "orderCode" : "orderCode1"
}'
```

```bash 
curl -v --location 'http://localhost:8013/order/cachable/1'
```