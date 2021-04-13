package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.UserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {


    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();

        try {
            Statement statement = (Statement) this.baseRepository.getConnection().createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT *" +
                    "from `user` ");

            User user = null;

            while (resultSet.next()) {
                user = new User(resultSet.getInt("id"), resultSet.getString("name")
                        , resultSet.getString("email"), resultSet.getString("country"));

                userList.add(user);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return userList;
    }

    @Override
    public boolean save(User user, String action) {
        boolean check = false;
        PreparedStatement preparedStatement = null;
        switch (action){

            case "delete":

                try {
                    preparedStatement = this.baseRepository.getConnection().prepareStatement("delete " +
                            "from `user`" +
                            "where id=?");
                    preparedStatement.setString(1,user.getId()+"");

                    check = preparedStatement.executeUpdate()>0;

                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;

            case "update":
                try {
                    preparedStatement = this.baseRepository.getConnection().prepareStatement("update `user` " +
                            "set `name` = ?,email= ?, country =? " +
                            "where id = ?;");
                    preparedStatement.setString(1, user.getName());
                    preparedStatement.setString(2, user.getEmail());
                    preparedStatement.setString(3, user.getCountry());
                    preparedStatement.setString(4, user.getId()+"");

                    check = preparedStatement.executeUpdate()>0;

                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "create":
                try {


                    preparedStatement = this.baseRepository.getConnection().prepareStatement(
                            "insert into `user` \n" +
                                    "values (?,?,?,?);");
                    preparedStatement.setInt(1, user.getId());
                    preparedStatement.setString(2, user.getName());
                    preparedStatement.setString(3, user.getEmail());
                    preparedStatement.setString(4, user.getCountry());

                    check=preparedStatement.executeUpdate()>0;


                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }


        return check;
    }

    @Override
    public User findById(Integer id) {

        User user= null;



        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("select *" +
                    "from `user`" +
                    "where id = ? ");
            preparedStatement.setString(1, id +"");

            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){

                user = new User(resultSet.getInt("id"), resultSet.getString("name")
                        , resultSet.getString("email"), resultSet.getString("country"));


            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return user;
    }

    public List<User> FindAllSort(){
        List<User> userList = new ArrayList<>();

        try {
            Statement statement = (Statement) this.baseRepository.getConnection().createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT *" +
                    "from `user` " +
                    "order by `name`");

            User user = null;

            while (resultSet.next()) {
                user = new User(resultSet.getInt("id"), resultSet.getString("name")
                        , resultSet.getString("email"), resultSet.getString("country"));

                userList.add(user);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return userList;


    }

    public List<User> findByCountry(String country){
        List<User> userList = new ArrayList<>();

        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select * \n" +
                            "from `user`" +
                            "where country= ?;");
            preparedStatement.setString(1,country);


            ResultSet resultSet = preparedStatement.executeQuery();

            User user = null;

            while (resultSet.next()) {
                user = new User(resultSet.getInt("id"), resultSet.getString("name")
                        , resultSet.getString("email"), resultSet.getString("country"));

                userList.add(user);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return userList;


    }

}
