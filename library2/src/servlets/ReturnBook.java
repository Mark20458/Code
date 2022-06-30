package servlets;

import dao.BookDao;
import dao.BorrowDao;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReturnBook", value = "/ReturnBook")
public class ReturnBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int book_id = Integer.valueOf(req.getParameter("book_id"));
        int stu_id = Integer.valueOf(req.getParameter("stu_id"));
        BorrowDao borrowDao = new BorrowDao();
        BookDao bookDao = new BookDao();
        Book book = bookDao.find(book_id);
        book.setNum(book.getNum() + 1);
        if (borrowDao.delete(stu_id, book_id) && bookDao.update(book))
            req.getRequestDispatcher("show_my_book.jsp").forward(req, resp);
        else req.getRequestDispatcher("ReturnBookFail.jsp").forward(req, resp);
    }
}
