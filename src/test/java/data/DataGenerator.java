package data;

public class DataGenerator {

    public static String getEmail() {
        String email = "sabar.hamkar111";
        int random = (int) (Math.random() * 222222);
        return email + random + "@tekschool.us";
    }
}
