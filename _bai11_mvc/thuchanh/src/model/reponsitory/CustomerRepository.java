package model.reponsitory;

import model.bean.Customer;

import java.util.List;

public interface CustomerRepository {

    List<Customer> findAll ();

    Customer findById(Integer id);

    void save(Customer customer);

    void update(Integer id, Customer customer);

    void remove(Integer id);


}
