package model.repository.impl;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepositoryImpl implements ProductRepository {
   private static Map<Integer, Product> productList= new TreeMap<>();

    static {
        productList = new TreeMap<>();
        productList.put(1, new Product(1, "Apple", 300.0));
        productList.put(2, new Product(2, "SamSung", 200.0));
        productList.put(3, new Product(3, "LG", 100.0));
    }



    @Override
    public List<Product> findAll() {
        return new ArrayList<Product>(productList.values());
    }

    @Override
    public Product findById(Integer id) {
        return productList.get(id);
    }

    @Override
    public void save(Product product) {

    }
}
