package org.example.springnativegradlesimple.repository;

import org.example.springnativegradlesimple.model.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
}
