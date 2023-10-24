package data;

public class DataGenerator {

    public static String getEmail() {
        String email = "Sabar_hamkar_";
        int random = (int) (Math.random() * 2222);
        return email + random + "@tekschool.us";
    }
}
