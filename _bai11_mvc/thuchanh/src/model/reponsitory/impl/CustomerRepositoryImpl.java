package model.reponsitory.impl;

import model.bean.Customer;
import model.reponsitory.CustomerRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class CustomerRepositoryImpl implements CustomerRepository {


    private static Map<Integer, Customer> customerMap;

    static {
        customerMap = new TreeMap<>();
        customerMap.put(432, new Customer(432, "Nguyen Van A",
                "vanA@gmail.com", "HN"));
        customerMap.put(153, new Customer(153, "Nguyen Van B",
                "vanB@gmail.com", "DN"));
        customerMap.put(490, new Customer(490, "Nguyen Van V",
                "vanV@gmail.com", "HCM"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customerMap.values());

    }

    @Override
    public Customer findById(Integer id) {
        return customerMap.get(id);
    }

    @Override
    public void save(Customer customer) {

    }

    @Override
    public void update(Integer id, Customer customer) {
        customerMap.put(id, customer);
    }

    @Override
    public void remove(Integer id) {
        customerMap.remove(id);
    }
}
