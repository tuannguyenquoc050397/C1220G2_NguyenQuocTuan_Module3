package model.service.impl;

import model.bean.Customer;
import model.reponsitory.CustomerRepository;
import model.reponsitory.impl.CustomerRepositoryImpl;
import model.service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    CustomerRepository customerRepository = new CustomerRepositoryImpl();


    @Override
    public List<Customer> findAll() {
        return this.customerRepository.findAll();
    }

    @Override
    public Customer findById(Integer id) {
        return this.customerRepository.findById(id);
    }

    @Override
    public void save(Customer customer) {

    }

    @Override
    public void update(Integer id, Customer customer) {
        this.customerRepository.update(id,customer);
    }

    @Override
    public void remove(Integer id) {
        this.customerRepository.remove(id);

    }
}
