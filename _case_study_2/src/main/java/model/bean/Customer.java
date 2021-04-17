package model.bean;

public class Customer extends Person {

    private String customerType;
    private String gender;

    public Customer() {

    }

    public Customer(String customerType, String gender) {
        this.customerType = customerType;
        this.gender = gender;
    }

    public Customer(String id, String name, String dateOfBirth, String idCard,
                    String phone, String email, String address, String customerType, String gender) {
        super(id, name, dateOfBirth, idCard, phone, email, address);
        this.customerType = customerType;
        this.gender = gender;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
