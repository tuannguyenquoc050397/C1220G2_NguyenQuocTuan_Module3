package model.service;

import model.bean.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll ();

    Customer findById(Integer id);

    void save(Customer customer);

    void update(Integer id, Customer customer);

    void remove(Integer id);

}
