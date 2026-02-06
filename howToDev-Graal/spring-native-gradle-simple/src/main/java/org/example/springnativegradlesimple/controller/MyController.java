package org.example.springnativegradlesimple.controller;

import java.lang.reflect.InvocationTargetException;
import org.example.springnativegradlesimple.model.Product;
import org.example.springnativegradlesimple.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MyController {

  private final ProductService productService;

  public MyController(ProductService productService) {

    this.productService = productService;
  }

  @GetMapping("")
  public String getCustomer()
      throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, InvocationTargetException {

    Class<?> someClass = Class.forName("org.example.springnativegradlesimple.controller.SomeClass");
    Object o = someClass.getDeclaredConstructor().newInstance();

    return o.toString();
  }

  @GetMapping("/{productId}")
  public Product getProduct(@PathVariable long productId) {
    return productService.getProduct(productId);
  }

  @GetMapping("/allProduct")
  public Iterable<Product> getAllProducts() {
    return productService.getAllProducts();
  }

}
