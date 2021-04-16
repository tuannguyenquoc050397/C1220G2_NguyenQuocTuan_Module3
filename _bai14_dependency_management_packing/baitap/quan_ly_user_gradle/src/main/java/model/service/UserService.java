package model.service;

import model.bean.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    boolean save(User user, String action);

    User findById(Integer id);

    User getById(Integer id );

    void addUserTransaction(User user, int[] permision);

    public void insertUpdateWithoutTransaction();
    public void insertUpdateUseTransaction();
    List<User> getAllSP();
    void editSP(Integer id, String name, String email, String country);
    boolean deleteSP(Integer id);

}
