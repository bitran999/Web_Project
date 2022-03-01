package services;

public class GoogleConst {
    //Tạo
    public static String GOOGLE_CLIENT_ID = "641342109621-ku4sp2tqo4cm9lad2mi5o1ehfmud3l7g.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";

    //Offline
    //public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/home/login/login-google";

    //Online
    public static String GOOGLE_REDIRECT_URI = "https://pconline-group-9.herokuapp.com/home/login/login-google";

    //Const
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
