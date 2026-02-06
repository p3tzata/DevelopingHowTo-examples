package org.example.springnativegradlesimple.service;

import lombok.RequiredArgsConstructor;
import org.example.springnativegradlesimple.model.Product;
import org.example.springnativegradlesimple.repository.ProductRepository;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ProductService {

  private final ProductRepository productRepository;

  public Iterable<Product> getAllProducts() {
    return productRepository.findAll();
  }

  public Product getProduct(long productId) {
    return productRepository.findById(productId)
        .orElseThrow(ArrayIndexOutOfBoundsException::new);
  }
}
