package model.repository.impl;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.PersonRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonRepositoryImpl implements PersonRepository {

    private BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();

        try {
            Statement statement = (Statement) this.baseRepository.getConnection().createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT *" +
                    "from customer");

            Customer customer =null;



                while (resultSet.next()){

                    customer = new Customer(resultSet.getString("id"),resultSet.getString("name"),
                            resultSet.getString("date_of_birth"),resultSet.getString("id_card"),
                            resultSet.getString("phone"),resultSet.getString("email"),
                            resultSet.getString("address"),resultSet.getInt("customer_type_id"),
                            resultSet.getString("gender"));

                    customerList.add(customer);
                }



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }





        return customerList;
    }
}
