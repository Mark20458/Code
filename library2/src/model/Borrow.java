package model;

import java.sql.Date;

public class Borrow {
    private int stu_id;
    private int book_id;
    private Date t1;
    private Date t2;

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public Date getT1() {
        return t1;
    }

    public void setT1(Date t1) {
        this.t1 = t1;
    }

    public Date getT2() {
        return t2;
    }

    public void setT2(Date t2) {
        this.t2 = t2;
    }

    @Override
    public String toString() {
        return "Borrow{" + "stu_id=" + stu_id + ", book_id=" + book_id + ", t1=" + t1 + ", t2=" + t2 + '}';
    }
}
