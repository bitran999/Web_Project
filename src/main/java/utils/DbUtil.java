package utils;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class DbUtil {
    static private final String JDBC_DRIVER = "com.postgresql.cj.jdbc.Driver";
    static private final String HOST_NAME = "localhost";
    static private final String DB_NAME = "pconlineweb";
    static private final String PORT = ":5432/";

    static private final String USER = "postgres";
    static private final String PASS = "101797";

    static private final String DB_URL = "jdbc:postgresql://" + HOST_NAME + PORT + DB_NAME;


    static final Sql2o sql2o = new Sql2o(DB_URL, USER, PASS);

    public static Connection openConn() { return sql2o.open(); }

    public static Connection openTran() { return sql2o.beginTransaction(); }

}
