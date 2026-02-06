package org.example.springnativegradlesimple.config;

import lombok.AllArgsConstructor;
import org.example.springnativegradlesimple.model.Product;
import org.example.springnativegradlesimple.repository.ProductRepository;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class StartUp implements ApplicationListener<ApplicationReadyEvent> {

private ProductRepository productRepository;

  @Override
  public void onApplicationEvent(final ApplicationReadyEvent event) {

    productRepository.save(Product.builder().name("Test article 1").price(25.99).build());
    productRepository.save(Product.builder().name("Test article 2").price(33).build());

  }
}
