package models;

import entity.Categories;
import entity.Users;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.Session;
import utils.HibernateUtil;

import java.sql.SQLException;
import java.util.List;

public class CategoriesModel {
    private static final Session session = HibernateUtil.openSession();

    //Lấy Id cuối
    public static int getLastId() throws SQLException {
        String hql = "select max(id) from Categories";
        if (CategoriesModel.getAll().size() != 0) {
            return session.createQuery(hql, Integer.class).uniqueResult();
        } else {
            return 0;
        }
    }
    //Lấy hết
    public static List<Categories> getAll() throws SQLException {
        String hql = "from Categories  order by id";
        return session.createQuery(hql, Categories.class).list();
    }
    //Lấy hết cate theo chome
    public static List<Categories> getByChome(byte chome) throws SQLException {
        session.clear();
        final String hql = "FROM Categories WHERE chome=:chome";
        return  session.createQuery(hql, Categories.class).setParameter("chome", chome).list();
    }

    //Lấy theo ID
    public static Categories getById(int id) throws SQLException {
        session.clear();
        return (Categories) session.get(Categories.class, id);
    }
    //Thêm
    public static void create(Categories entity){
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            session.save(entity);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        }
    }
    //Update
    public static void update(Categories entity) {
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
    public static void delete(Categories entity) {
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
