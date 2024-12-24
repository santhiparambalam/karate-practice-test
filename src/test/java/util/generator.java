package util;
import java.lang.Math;

public class generator {

    public static int generateRandomNumber(int max){
        int randomNumber = (int)(Math.random() * max);
        return randomNumber;
    }

    public static String generateRandomEmail(String emailPrefix){
        String randomEmail = emailPrefix + (int)(Math.random() * 10000000) + "@testmail.com";
        return randomEmail;
    }
}