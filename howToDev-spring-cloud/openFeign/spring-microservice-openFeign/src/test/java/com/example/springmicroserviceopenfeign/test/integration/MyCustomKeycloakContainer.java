package com.example.springmicroserviceopenfeign.test.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.BooleanNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.TextNode;
import dasniko.testcontainers.keycloak.KeycloakContainer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.testcontainers.containers.output.Slf4jLogConsumer;

public class MyCustomKeycloakContainer extends KeycloakContainer {
  private static final ObjectMapper objectMapper = new ObjectMapper();
  private static final Logger logger = LoggerFactory.getLogger(MyCustomKeycloakContainer.class);
  private String DEFAULT_REALM = "myRealm";
  private String DEFAULT_CONTEXT_PATCH = "/auth";

  public MyCustomKeycloakContainer() {
    this.withContextPath(DEFAULT_CONTEXT_PATCH)
        .withRealmImportFile("/myRealm-keycloakContainer.json")
        .withLogConsumer(new Slf4jLogConsumer(logger));
  }

  @Override
  public MyCustomKeycloakContainer withReuse(boolean reuse) {

    return (MyCustomKeycloakContainer) super.withReuse(reuse);

  }

  public String getRealmUrl() {

    return super.getAuthServerUrl() + "/realms/" + DEFAULT_REALM;
  }

  public String getTokenUri() {

    return getRealmUrl() + "/protocol/openid-connect/token";
  }

}
