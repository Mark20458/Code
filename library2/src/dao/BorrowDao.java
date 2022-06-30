package dao;

import model.Borrow;
import model.Student;
import util.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BorrowDao {
    private Connection con = null;
    private PreparedStatement prepStmt = null;
    private ResultSet rs = null;

    public boolean checkBorrow(int stu_id, int book_id) {
        String sql = "Select * From borrow Where stu_id=? and book_id=?";// 一个人不能借两本不同的书
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, stu_id);
            prepStmt.setInt(2, book_id);
            rs = prepStmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public ArrayList<Borrow> find(int stu_id) {
        ArrayList<Borrow> list = new ArrayList<>();
        String sql = "Select * From borrow Where stu_id=?";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, stu_id);
            rs = prepStmt.executeQuery();
            Borrow borrow;
            while (rs.next()) {
                borrow = new Borrow();
                borrow.setStu_id(rs.getInt(1));
                borrow.setBook_id(rs.getInt(2));
                borrow.setT1(rs.getDate(3));
                borrow.setT2(rs.getDate(4));
                list.add(borrow);
            }
            if (list.size() != 0) return list;
            else return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public ArrayList<Borrow> findAll() {
        ArrayList<Borrow> list = new ArrayList<>();
        String sql = "Select * From borrow";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            rs = prepStmt.executeQuery();
            Borrow borrow;
            while (rs.next()) {
                borrow = new Borrow();
                borrow.setStu_id(rs.getInt(1));
                borrow.setBook_id(rs.getInt(2));
                borrow.setT1(rs.getDate(3));
                borrow.setT2(rs.getDate(4));
                list.add(borrow);
            }
            if (list.size() != 0) return list;
            else return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }


    public boolean add(Borrow borrow) {
        String sql = "Insert into borrow(stu_id,book_id,t2) values(?,?,?)";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, borrow.getStu_id());
            prepStmt.setInt(2, borrow.getBook_id());
            prepStmt.setDate(3, borrow.getT2());
            int n = prepStmt.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public boolean delete(int stu_id, int book_id) {
        String sql = "delete from borrow where stu_id=? and book_id=?";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, stu_id);
            prepStmt.setInt(2, book_id);
            int n = prepStmt.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }
}