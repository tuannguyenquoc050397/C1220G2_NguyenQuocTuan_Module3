package model.repository;

import model.bean.User;

import java.util.List;

public interface UserRepository {


    List<User> findAll();

    boolean save(User user, String action);

    User findById(Integer id);


}
