package servlets;

import dao.BookDao;
import dao.BorrowDao;
import model.Book;
import model.Borrow;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "BorrowServlet", value = "/BorrowServlet")
public class BorrowServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String t = req.getParameter("t2");
        int book_id = Integer.valueOf(req.getParameter("book_id"));
        int stu_id = Integer.valueOf(req.getParameter("stu_id"));
        Date t2 = Date.valueOf(t);
        Borrow borrow = new Borrow();
        borrow.setT2(t2);
        borrow.setStu_id(stu_id);
        borrow.setBook_id(book_id);
        BorrowDao borrowDao = new BorrowDao();
        if (borrowDao.checkBorrow(stu_id, book_id)) {
            req.getRequestDispatcher("BorrowExist.jsp").forward(req, resp);
            return;
        }
        BookDao bookDao = new BookDao();
        Book book = bookDao.find(book_id);
        book.setNum(book.getNum() - 1);
        if (borrowDao.add(borrow) && bookDao.update(book))
            req.getRequestDispatcher("BorrowSuccess.jsp").forward(req, resp);
        else req.getRequestDispatcher("BorrowFail.jsp").forward(req, resp);
    }
}
