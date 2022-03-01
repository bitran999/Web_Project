package models;

import entity.Admins;
import entity.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.sql2o.Connection;
import utils.DbUtil;
import utils.HibernateUtil;

import java.sql.SQLException;
import java.util.List;

public class UsersModel {
    public static Session session = HibernateUtil.openSession();
    //Lấy Id mới
    public static int getNewId() throws SQLException {
        String hql = "select max(id) from Users ";
        if (UsersModel.getAll().size() != 0) {
            return session.createQuery(hql, Integer.class).uniqueResult() + 1;
        } else {
            return 1;
        }
    }

    //Lấy hết
    public static List<Users> getAll() throws SQLException {
        final String hql = "FROM Users order by id";
        return session.createQuery(hql, Users.class).list();
    }

    //Lấy theo ID
    public static Users getById(int id) throws SQLException {
        session.clear();
        return (Users) session.get(Users.class, id);
    }
    //Lấy theo email
    public static Users getByEmail(String email) throws SQLException {
        session.clear();
        final String hql = "FROM Users WHERE email=:email";
        return  session.createQuery(hql, Users.class).setParameter("email", email).uniqueResult();
    }


    //Thêm
    public static void create(Users entity) {
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            entity.setPassword(encryptPass(entity.getPassword()));
            session.save(entity);
            t.commit();
            System.out.println("Commit user");
        } catch (Exception e) {
            t.rollback();
            System.out.println("Rollback user");
        }
    }

    //Update
    public static void update(Users entity) {
        session.clear();
        // TODO Auto-generated method stub
        Transaction t = session.beginTransaction();
        try {
            session.update(entity);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        }
    }

    //Xóa
    public static void delete(Users entity) {
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
