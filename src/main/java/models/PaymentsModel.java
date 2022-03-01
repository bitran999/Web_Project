package models;

import entity.Payments;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateUtil;

import java.sql.SQLException;
import java.util.List;

public class PaymentsModel {
    public static Session session = HibernateUtil.openSession();

    //Lấy Id cuối
    public static int getNewId() throws SQLException {
        String hql = "select max(id) from Payments";
        if (PaymentsModel.getAll().size() != 0) {
            return session.createQuery(hql, Integer.class).uniqueResult() + 1;
        } else {
            return 1;
        }
    }
    //Lấy hết
    public static List<Payments> getAll() throws SQLException {
        final String hql = "FROM Payments order by id";
        return session.createQuery(hql, Payments.class).list();
    }
    //Lấy theo ID
    public static Payments getById(int id) throws SQLException {
        session.clear();
        return (Payments) session.get(Payments.class, id);
    }
    //Thêm
    public static void create(Payments entity){
        session.clear();
        //Transaction t = session.beginTransaction();
        /*try {
            session.save(entity);
            t.commit();
            System.out.println("commit");
        } catch (Exception e) {
            t.rollback();
            System.out.println("rollback");
        }*/
        try{
            session.save(entity);
        } catch (Exception e){
            System.out.println("error");
            throw e;
        }

    }
    //Update
    public static void update(Payments entity) {
        session.clear();
        // TODO Auto-generated method stub
        Transaction t = session.beginTransaction();
        try {
            session.update(entity);
            t.commit();
        }catch(Exception e) {
            t.rollback();
        }
    }
    //Xóa
    public static void delete(Payments entity) {
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            session.delete(entity);
            t.commit();
        }catch(Exception e) {
            t.rollback();
        }
    }
}
