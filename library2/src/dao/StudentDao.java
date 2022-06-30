package dao;

import model.Student;
import util.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDao {
    private Connection con = null;
    private PreparedStatement prepStmt = null;
    private ResultSet rs = null;

    //检查用户是否存在
    public Student checkExist(Student stu) {
        String sql = "Select * From student Where id=? and pass=?";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, stu.getId());
            prepStmt.setString(2, stu.getPass());
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                stu.setId(rs.getInt(1));
                stu.setName(rs.getString(2));
                stu.setPass(rs.getString(3));
                stu.setIdentity(rs.getBoolean(4));
                return stu;
            } else return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    //添加用户（只能添加普通用户，管理员只能通过后台数据库添加）
    public Student add(Student stu) {
        String sql = "Insert into student(name,pass) values(?,?)";
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setString(1, stu.getName());
            prepStmt.setString(2, stu.getPass());
            int n = prepStmt.executeUpdate();
            if (n > 0) {
                stu.setId(max());
                return stu;
            } else return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    //注册之后返回用户ID
    public int max() {
        try {
            con = DbConnect.getDBconnection();
            String sql = "Select MAX(id) From student";
            prepStmt = con.prepareStatement(sql);
            rs = prepStmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
            else return 0;
        } catch (Exception e) {
            return 0;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public boolean delete(int id) {
        String sql = "delete from student where id=? and identity=0";// 不能删除管理员，只能后台数据库删除
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, id);
            int n = prepStmt.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public boolean update(Student stu) {
        String sql = "update student set name=?,pass=? where id=?";// 只能改名字和密码
        try {
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setString(1, stu.getName());
            prepStmt.setString(2, stu.getPass());
            prepStmt.setInt(3, stu.getId());
            int n = prepStmt.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            return false;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    public Student find(int id) {
        String sql = "Select * From student Where id=?";
        System.out.println(id);
        try {
            Student stu = new Student();
            con = DbConnect.getDBconnection();
            prepStmt = con.prepareStatement(sql);
            prepStmt.setInt(1, id);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                stu.setId(rs.getInt(1));
                stu.setName(rs.getString(2));
                stu.setPass(rs.getString(3));
                stu.setIdentity(rs.getBoolean(4));
                return stu;
            } else return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }
}
