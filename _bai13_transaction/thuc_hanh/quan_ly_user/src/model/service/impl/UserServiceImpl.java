package model.service.impl;

import model.bean.User;
import model.repository.UserRepository;
import model.repository.impl.UserRepositoryImpl;
import model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {


    private   UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return this.userRepository.findAll();
    }

    @Override
    public boolean save(User user, String action) {

       switch (action){
           case "update":
               if (user.getName().matches("[A-Za-z1-9 ]+")) {
                   return this.userRepository.save(user, action);
               }
               break;
           case "create":
           case "delete":
               return  this.userRepository.save(user,action);
       }

        return false;
    }

    @Override
    public User findById(Integer id) {
        return this.userRepository.findById(id);
    }

    @Override
    public User getById(Integer id) {
        return this.userRepository.getById(id);
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        this.userRepository.addUserTransaction(user, permision);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        this.userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {

        this.userRepository.insertUpdateUseTransaction();
    }

    public List<User> findAllSort(){

        return ((UserRepositoryImpl)this.userRepository).FindAllSort();

    }

    public List<User> findByCountry(String country){

        return ((UserRepositoryImpl)this.userRepository).findByCountry(country);
    }
}
