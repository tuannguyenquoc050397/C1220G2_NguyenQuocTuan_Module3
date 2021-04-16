package model.service.impl;

import model.bean.Customer;
import model.bean.Person;
import model.repository.PersonRepository;
import model.repository.impl.PersonRepositoryImpl;
import model.service.PersonService;

import java.util.List;

public class PersonServiceImpl implements PersonService {

    PersonRepository personRepository = new PersonRepositoryImpl();


    @Override
    public List<Customer> findAll( ) {
        return this.personRepository.findAll();
    }

}
