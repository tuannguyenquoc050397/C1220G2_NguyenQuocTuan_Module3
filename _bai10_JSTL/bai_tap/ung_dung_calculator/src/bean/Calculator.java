package bean;

public class Calculator {

    public static float calculator(float number1, float number2, char operator){


        switch (operator){
            case '+':
                return number1+number2;

            case '-':
                return number1-number2 ;

            case '*':
                return number1*number2;

            case '/':
                if (number2==0){
                    throw new RuntimeException("Can't divide by zero");
                }else{
                    return number1/number2;
                }
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
