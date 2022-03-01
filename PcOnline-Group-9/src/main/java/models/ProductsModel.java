package models;

import entity.Categories;
import entity.Products;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utils.HibernateUtil;

import java.sql.SQLException;
import java.util.List;

public class ProductsModel {
    public static Session session = HibernateUtil.openSession();
    //Đếm tổng record
    public long countTotalRecords() {
        String countQ = "Select count (id) from Products ";
        return (Long) session.createQuery(countQ).uniqueResult();
    }
    public static List<Products> getByCidPagination(int proCategoryId, int position, int pageSize) {
        session.clear();
        final String hql = "FROM Products WHERE categoriesByProcategoryid.id=:proCategoryId";
        Query query = session.createQuery(hql, Products.class);
        query.setFirstResult(position);
        query.setMaxResults(pageSize);
        query.setParameter("proCategoryId", proCategoryId);
        return query.list();
    }

    //Lấy Id cuối
    public static int getLastId() throws SQLException {
        String hql = "select max(id) from Products";
        if (ProductsModel.getAll().size() != 0) {
            return session.createQuery(hql, Integer.class).uniqueResult();
        } else {
            return 0;
        }
    }
    //Lấy hết
    public static List<Products> getAll() throws SQLException {
        final String hql = "FROM Products order by id";
        return session.createQuery(hql, Products.class).list();
    }
    //Lấy hết theo cateID
    public static List<Products> getByCId(int proCategoryId) throws SQLException {
        session.clear();
        final String hql = "FROM Products WHERE categoriesByProcategoryid.id=:proCategoryId";
        return  session.createQuery(hql, Products.class).setParameter("proCategoryId", proCategoryId).list();
    }
    //Lấy theo ID
    public static Products getById(int id) throws SQLException {
        session.clear();
        return (Products) session.get(Products.class, id);
    }
    //Thêm
    public static void create(Products entity){
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
    public static void update(Products entity) {
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
    public static void delete(Products entity) {
        session.clear();
        Transaction t = session.beginTransaction();
        try {
            session.delete(entity);
            t.commit();
        }catch(Exception e) {
            t.rollback();
        }
    }

    //Sql2o - Thêm
    /*public static Products create(String proName, String proSlug,
                                  int proCategoryId, int proPrice, int proAuthorId,
                                  byte proSale, byte proActive, byte proHot,
                                  String proDescription, String proAvatar,String proContent,
                                  byte proNumber) {

        String sql = "select * FROM Products WHERE proName =:proName";

        try (org.sql2o.Connection conn = DbUtil.openTran()) {
            Products product = conn.createQuery(sql).addParameter("proName", proName).throwOnMappingFailure(false).executeAndFetchFirst(Products.class);
            if(product != null)
            {
                System.out.println("Sản phẩm đã tồn tại!!!!");
                return null;
            } else {
                sql = "INSERT INTO Products (proName, proSlug, proCategoryId, proPrice, proAuthorId, proSale, proActive, proHot," +
                            "proDescription, proAvatar, proContent, proNumber) " +
                        "VALUES (:proName, :proSlug, :proCategoryId, :proPrice, :proAuthorId, :proSale, :proActive, :proHot," +
                            ":proDescription, :proAvatar, :proContent, :proNumber) ";
            }
            conn.createQuery(sql)
                    .addParameter("proName", proName)
                    .addParameter("proSlug", proSlug)
                    .addParameter("proCategoryId", proCategoryId)
                    .addParameter("proPrice", proPrice)
                    .addParameter("proAuthorId", proAuthorId)
                    .addParameter("proSale", proSale)
                    .addParameter("proActive", proActive)
                    .addParameter("proHot", proHot)
                    .addParameter("proDescription", proDescription)
                    .addParameter("proAvatar", proAvatar)
                    .addParameter("proContent", proContent)
                    .addParameter("proNumber", proNumber)
                    .executeUpdate();
            conn.commit();
            return null;
        }
    }*/

   /* public static Products update(Integer id, String proName, String proSlug,
                                  int proCategoryId, int proPrice, int proAuthorId,
                                  byte proSale, byte proActive, byte proHot,
                                  String proDescription, String proAvatar,String proContent,
                                  byte proNumber) {
        String sql = "select * FROM Products WHERE proName =:proName and id!=:id";
        try (org.sql2o.Connection conn = DbUtil.openTran()) {
            Products product = conn.createQuery(sql)
                    .addParameter("id", id)
                    .addParameter("proName", proName)
                    .throwOnMappingFailure(false).executeAndFetchFirst(Products.class);
            if(product != null)
            {
                System.out.println("Tên danh mục đã tồn tại!!!!");
                return null;
            } else {
                sql = "update Products set proName=:proName, proSlug=:proSlug, proCategoryId=:proCategoryId, proPrice=:proPrice, " +
                        "proAuthorId=:proAuthorId, proSale=:proSale, proActive=:proActive, proHot=:proHot, proDescription=:proDescription, " +
                        "proAvatar=:proAvatar, proContent=:proContent, proNumber=:proNumber where id =:id";
            }
            conn.createQuery(sql)
                    .addParameter("id", id)
                    .addParameter("proName", proName)
                    .addParameter("proSlug", proSlug)
                    .addParameter("proCategoryId", proCategoryId)
                    .addParameter("proPrice", proPrice)
                    .addParameter("proAuthorId", proAuthorId)
                    .addParameter("proSale", proSale)
                    .addParameter("proActive", proActive)
                    .addParameter("proHot", proHot)
                    .addParameter("proDescription", proDescription)
                    .addParameter("proAvatar", proAvatar)
                    .addParameter("proContent", proContent)
                    .addParameter("proNumber", proNumber)
                    .executeUpdate();
            conn.commit();
            return null;
        }
    }*/




}
