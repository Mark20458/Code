package servlets;

import dao.BookDao;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddBook", value = "/AddBook")
public class AddBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Book book = new Book();
        book.setId(Integer.valueOf(request.getParameter("id")));
        book.setName(request.getParameter("name"));
        book.setAuthor(request.getParameter("author"));
        book.setIntro(request.getParameter("intro"));
        book.setNum(Integer.valueOf(request.getParameter("num")));
        BookDao bookDao = new BookDao();
        if (bookDao.add(book)) request.getRequestDispatcher("AddBookSuccess.jsp").forward(request, response);
        else request.getRequestDispatcher("AddBookFail.jsp").forward(request, response);
    }
}
