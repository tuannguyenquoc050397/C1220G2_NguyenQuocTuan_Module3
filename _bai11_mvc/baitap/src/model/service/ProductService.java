package model.service;

import model.bean.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    Product findById(Integer id);

    void save(Product product);
}
