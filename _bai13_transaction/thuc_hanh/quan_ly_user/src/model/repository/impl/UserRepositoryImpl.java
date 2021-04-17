package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.UserRepository;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";

    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";

    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"

            + "("

            + " ID serial,"

            + " NAME varchar(100) NOT NULL,"

            + " SALARY numeric(15, 2) NOT NULL,"

            + " CREATED_DATE timestamp,"

            + " PRIMARY KEY (ID)"

            + ")";

    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";


    private static final String INSERT_USERS_SQL = "insert into `user` \n" +
            "values (?,?,?,?);";
    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertUpdateUseTransaction() {
        try (Connection conn = this.baseRepository.getConnection();

             Statement statement = conn.createStatement();

             PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);

             PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE)) {

            statement.execute(SQL_TABLE_DROP);

            statement.execute(SQL_TABLE_CREATE);

            // start transaction block

            conn.setAutoCommit(false); // default true

            // Run list of insert commands

            psInsert.setString(1, "Quynh");

            psInsert.setBigDecimal(2, new BigDecimal(10));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            psInsert.setString(1, "Ngan");

            psInsert.setBigDecimal(2, new BigDecimal(20));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            // Run list of update commands



            // below line caused error, test transaction

            // org.postgresql.util.PSQLException: No value specified for parameter 1.

           // psUpdate.setBigDecimal(2, new BigDecimal(999.99));



            psUpdate.setBigDecimal(1, new BigDecimal(999.99));

            psUpdate.setString(2, "Quynh");

            psUpdate.execute();



            // end transaction block, commit changes

            conn.commit();

            // good practice to set it back to default true

            conn.setAutoCommit(true);



        } catch (Exception e) {

            System.out.println(e.getMessage());

            e.printStackTrace();

        }

    }

    @Override
    public void insertUpdateWithoutTransaction() {

        try (Connection conn = this.baseRepository.getConnection();

             Statement statement = conn.createStatement();

             PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);

             PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE)) {



            statement.execute(SQL_TABLE_DROP);

            statement.execute(SQL_TABLE_CREATE);



            // Run list of insert commands

            psInsert.setString(1, "Quynh");

            psInsert.setBigDecimal(2, new BigDecimal(10));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            psInsert.setString(1, "Ngan");

            psInsert.setBigDecimal(2, new BigDecimal(20));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            // Run list of update commands



            // below line caused error, test transaction

            // org.postgresql.util.PSQLException: No value specified for parameter 1.

            psUpdate.setBigDecimal(2, new BigDecimal(999.99));



            //psUpdate.setBigDecimal(1, new BigDecimal(999.99));

            psUpdate.setString(2, "Quynh");

            psUpdate.execute();



        } catch (Exception e) {

            e.printStackTrace();

        }


    }

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

    @Override
    public User getById(Integer id) {

        User user= null;


        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().prepareCall("call get_user_by_id(?);");

            callableStatement.setInt(1,id);

            ResultSet resultSet = callableStatement.executeQuery();

            if(resultSet.next()){

                user = new User(resultSet.getInt("id"), resultSet.getString("name")
                        , resultSet.getString("email"), resultSet.getString("country"));

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return user;
    }

    @Override

        public void addUserTransaction(User user, int[] permisions) {

            Connection conn = null;

            // for insert a new user

            PreparedStatement pstmt = null;

            // for assign permision to user

            PreparedStatement pstmtAssignment = null;

            // for getting user id

            ResultSet rs = null;

            try {

                conn = this.baseRepository.getConnection();

                // set auto commit to false

                conn.setAutoCommit(false);

                //

                // Insert user

                //

                pstmt = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);

                pstmt.setInt(1, user.getId());

                pstmt.setString(2, user.getName());

                pstmt.setString(3, user.getEmail());

                pstmt.setString(4, user.getCountry());

                int rowAffected = pstmt.executeUpdate();

                // get user id

                rs = pstmt.getGeneratedKeys();

                int userId = user.getId();

                if (rs.next())

                    userId = user.getId();

                //

                // in case the insert operation successes, assign permision to user

                //

                if (rowAffected == 1) {

                    // assign permision to user

                    String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "

                            + "VALUES(?,?)";

                    pstmtAssignment = conn.prepareStatement(sqlPivot);

                    for (int permisionId : permisions) {

                        pstmtAssignment.setInt(1, userId);

                        pstmtAssignment.setInt(2, permisionId);

                        pstmtAssignment.executeUpdate();

                    }

                    conn.commit();

                } else {

                    conn.rollback();

                }

            } catch (SQLException ex) {

                // roll back the transaction

                try {

                    if (conn != null)

                        conn.rollback();

                } catch (SQLException e) {

                    System.out.println(e.getMessage());

                }

                System.out.println(ex.getMessage());

            } finally {

                try {

                    if (rs != null) rs.close();

                    if (pstmt != null) pstmt.close();

                    if (pstmtAssignment != null) pstmtAssignment.close();

                    if (conn != null) conn.close();

                } catch (SQLException e) {

                    System.out.println(e.getMessage());

                }

            }

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
