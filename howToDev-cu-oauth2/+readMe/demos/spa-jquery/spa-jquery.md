`spa-jquery`
 - npm install; npm start;
 - http://localhost:8007/cu
 - Cors must be configured either on API or resource-server - not on both.

depends:
 - mocks (keycloak: cu-spa-jquery)
 - eureka-discovery-server
 - resource-server (GET http://localhost:8002/order/getAll)
 - api-gateway (GET http://localhost:8003/order/getAll)