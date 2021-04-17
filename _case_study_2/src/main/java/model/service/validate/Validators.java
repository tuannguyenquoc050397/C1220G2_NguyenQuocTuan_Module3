package model.service.validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validators {



    private static Pattern pattern;
    private static Matcher matcher;

    public static boolean isValidRegex(String str, String regex) {
        pattern = Pattern.compile(regex);
        matcher = pattern.matcher(str);
        boolean flag = matcher.matches();
        if (!flag) {
            System.out.println("input not matching: " + regex);
        }
        return flag;
    }


}
