package models;

import entity.Admins;
import entity.Categories;
import entity.Products;
import entity.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.sql2o.Connection;
import utils.DbUtil;
import utils.HibernateUtil;

import java.sql.SQLException;
import java.time.Instant;
import java.util.List;

public class AdminsModel {
    public static Session session = HibernateUtil.openSession();

    //Lấy hết
    public static List<Admins> getAll() throws SQLException {
        String hql = "from Admins  order by id";
        return session.createQuery(hql, Admins.class).list();
    }

    //Lấy theo email
    public static Admins getByEmail(String email) throws SQLException {
        session.clear();
        final String hql = "FROM Admins WHERE email=:email";
        return  session.createQuery(hql, Admins.class).setParameter("email", email).uniqueResult();
    }

    public static Admins get(String email) {
        String sql = "select * FROM Admins WHERE email =:email";
        Connection conn = DbUtil.openConn();
        Admins admin = conn.createQuery(sql).addParameter("email", email).throwOnMappingFailure(false).executeAndFetchFirst(Admins.class);
        /*conn.close();*/
        return admin;
    }
    //Lấy theo ID
    public static Admins getById(int id) throws SQLException {
        session.clear();
        return (Admins) session.get(Admins.class, id);
    }
    //Create
    public static Admins create(String name, String email, String password){
        String sql = "select * FROM admins WHERE email =:email";
        Connection conn = DbUtil.openConn();
        Admins admin = conn.createQuery(sql).addParameter("email", email).throwOnMappingFailure(false).executeAndFetchFirst(Admins.class);
        if(admin != null)
        {
            System.out.println("Có dữ liệu r");
            /*conn.close();*/
            return admin;
        } else
        {
            sql = "insert into admins (name, email, password) values (:name, :email, :password)";
        }

        Instant now = Instant.now();
        int id = conn.createQuery(sql)
                .addParameter("name", name)
                .addParameter("email", email)
                .addParameter("password", encryptPass(password))
                .executeUpdate().getKey(int.class);
        /*conn.close();*/
        return admin;
    }

    //Xóa
    public static void delete(Admins entity) {
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            session.delete(entity);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        }

    }
    //Mã hóa mật khẩu
    public static String encryptPass(String pass) {
        return BCrypt.hashpw(pass, BCrypt.gensalt());
    }
    //Kiểm tra mật khẩu
    public static boolean checkPass(String pass, String encryptedpass) {
        return BCrypt.checkpw(pass, encryptedpass);
    }
}
