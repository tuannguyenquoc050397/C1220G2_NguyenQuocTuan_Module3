package model.repository;

import model.bean.User;

import java.util.List;

public interface UserRepository {

    public void insertUpdateUseTransaction();



    public void insertUpdateWithoutTransaction();

    List<User> findAll();

    boolean save(User user, String action);

    User findById(Integer id);

    User getById(Integer id);

    void addUserTransaction(User user, int[] permision);

}
