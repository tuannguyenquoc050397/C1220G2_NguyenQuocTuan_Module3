package model.repository;

import model.bean.Customer;

import java.util.List;

public interface CustomerRepository {

    List<Customer> findAll();

    boolean delete(Integer id);

    Customer findById(Integer id);

    boolean update(Customer customer);

    boolean create(Customer customer);


}
