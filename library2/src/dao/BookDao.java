package dao;

import model.Book;
import util.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDao {
    private Connection con = null;
    private PreparedStatement prepStmt = null;
    private ResultSet rs = null;

    public ArrayList<Book> find(String name) {
        ArrayList<Book> list = new ArrayList<>();
        String sql = "Select * From book Where name like " + "\'%" + name + "%\'";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            rs = prepStmt.executeQuery();
            Book book;
            while (rs.next()) {
                book = new Book();
                book.setId(rs.getInt(1));
                book.setName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setIntro(rs.getString(4));
                book.setNum(rs.getInt(5));
                list.add(book);
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

    public Book find(int id) {
        String sql = "Select * From book Where id=?";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, id);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt(1));
                book.setName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setIntro(rs.getString(4));
                book.setNum(rs.getInt(5));
                return book;
            } else return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public boolean add(Book book) {
        String sql = "Insert into book(id,name,author,intro,num) values(?,?,?,?,?)";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, book.getId());
            prepStmt.setString(2, book.getName());
            prepStmt.setString(3, book.getAuthor());
            prepStmt.setString(4, book.getIntro());
            prepStmt.setInt(5, book.getNum());
            int n = prepStmt.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public boolean update(Book book) {
        String sql = "update book set name=?,author=?,intro=?, num=? where id=?";
        try {
            System.out.println(book);
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setString(1, book.getName());
            prepStmt.setString(2, book.getAuthor());
            prepStmt.setString(3, book.getIntro());
            prepStmt.setInt(4, book.getNum());
            prepStmt.setInt(5, book.getId());
            int n = prepStmt.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }
}
