package model.repository.impl;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.CustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {

    private static final String SQL_SELECT_ALL_CUSTOMER = "SELECT *" + "from customer";

    private static final String SQL_DELETE_CUSTOMER = "DELETE from customer where id= ?";
    private static final String SQL_SELECT_BY_ID = "select * from customer where id= ?" ;
    private static final String SQL_UPDATE_CUSTOMER = "update customer set `name` = ?, date_of_birth = ?,\n" +
            "            gender = ?, id_card = ?, phone =?, email = ?, address = ?, customer_type_id = ?\n" +
            "            where  id = ?;" ;

    private static final String SQL_CREATE_CUSTOMER = "insert into customer \n" +
            "\tvalues\n" +
            "\t\t(?,?, ?,?,?,?,?,?,?);";


    private BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();

        try {
            Statement statement = (Statement) this.baseRepository.getConnection().createStatement();

            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL_CUSTOMER);

            Customer customer =null;



                while (resultSet.next()){

                    customer = new Customer(resultSet.getString("id"),resultSet.getString("name"),
                            resultSet.getString("date_of_birth"),resultSet.getString("id_card"),
                            resultSet.getString("phone"),resultSet.getString("email"),
                            resultSet.getString("address"),resultSet.getString("customer_type_id"),
                            resultSet.getString("gender"));

                    customerList.add(customer);
                }



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }





        return customerList;
    }

    @Override
    public boolean delete(Integer id) {

        boolean checkActionDelete = false;

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SQL_DELETE_CUSTOMER);

            preparedStatement.setInt(1,id);

            checkActionDelete = preparedStatement.executeUpdate()>0;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return checkActionDelete;
    }

    @Override
    public Customer findById(Integer id) {

        Customer customer = null;

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SQL_SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();

                    customer = new Customer(resultSet.getString("id"),resultSet.getString("name"),
                    resultSet.getString("date_of_birth"),resultSet.getString("id_card"),
                    resultSet.getString("phone"),resultSet.getString("email"),
                    resultSet.getString("address"),resultSet.getString("customer_type_id"),
                    resultSet.getString("gender"));



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return customer;
    }

    @Override
    public boolean update(Customer customer) {

        boolean checkUpdate = false;

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SQL_UPDATE_CUSTOMER);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setInt(3, Integer.parseInt(customer.getGender()));
            preparedStatement.setString(4,customer.getIdCard());
            preparedStatement.setString(5,customer.getPhone());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setString(8,customer.getCustomerType());
            preparedStatement.setInt(9, Integer.parseInt(customer.getId()));


            checkUpdate= preparedStatement.executeUpdate()>0;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return checkUpdate;
    }

    @Override
    public boolean create(Customer customer) {
        boolean checkCreate = false;

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SQL_CREATE_CUSTOMER);
            preparedStatement.setInt(1, Integer.parseInt(customer.getId()));
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setString(3,customer.getDateOfBirth());
            preparedStatement.setInt(4, Integer.parseInt(customer.getGender()));
            preparedStatement.setString(5,customer.getIdCard());
            preparedStatement.setString(6,customer.getPhone());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
            preparedStatement.setString(9,customer.getCustomerType());


            checkCreate= preparedStatement.executeUpdate()>0;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return checkCreate;
    }
}
