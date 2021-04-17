package model.service;

import model.bean.Customer;

import java.util.List;

public interface CustomerService {


    List<Customer> findAll();

    boolean delete(Integer id);

    Customer findById(Integer id);

    boolean update(Customer customer);

    boolean create(Customer customer);

}
