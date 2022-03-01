package models;

import entity.Products;
import entity.Transactions;
import entity.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateUtil;

import java.sql.SQLException;
import java.util.List;

public class TransactionsModel {
    public static Session session = HibernateUtil.openSession();

    //Lấy Id cuối
    public static int getNewId() throws SQLException {
        String hql = "select max(id) from Transactions";
        if (TransactionsModel.getAll().size() != 0) {
            return session.createQuery(hql, Integer.class).uniqueResult() + 1;
        } else {
            return 1;
        }
    }
    //Lấy hết
    public static List<Transactions> getAll() throws SQLException {
        final String hql = "FROM Transactions order by id";
        return session.createQuery(hql, Transactions.class).list();
    }
    //Lấy theo ID
    public static Transactions getById(int id) throws SQLException {
        session.clear();
        return (Transactions) session.get(Transactions.class, id);
    }
    //Lấy theo trạng thái đơn hàng
    public static List<Transactions> getByStatus(byte trstatus) throws SQLException {
        session.clear();
        final String hql = "FROM Transactions WHERE trstatus=:trstatus";
        return  session.createQuery(hql, Transactions.class).setParameter("trstatus", trstatus).list();
    }


    //Thêm
    public static void create(Transactions entity){
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            session.save(entity);
            t.commit();
            System.out.println("commit trans");
        } catch (Exception e) {
            t.rollback();
            System.out.println("rollback trans");
        }
    }
    //Update
    public static void update(Transactions entity) {
        session.clear();
        // TODO Auto-generated method stub
        Transaction t = session.beginTransaction();
        try {
            session.update(entity);
            t.commit();
            System.out.println("commit trans");
        }catch(Exception e) {
            t.rollback();
            System.out.println("rollback trans");
        }
    }
    //Xóa
    public static void delete(Transactions entity) {
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            session.delete(entity);
            t.commit();
            System.out.println("commit trans");
        }catch(Exception e) {
            t.rollback();
            System.out.println("rollback trans");
        }
    }


}
