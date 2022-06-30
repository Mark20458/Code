package servlets;

import dao.BookDao;
import dao.StudentDao;
import model.Book;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Update", value = "/Update")
public class Update extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Student stu = new Student();
        stu.setId(Integer.valueOf(request.getParameter("id")));
        StudentDao studentDao = new StudentDao();
        stu = studentDao.find(stu.getId());
        stu.setName(request.getParameter("name"));
        stu.setPass(request.getParameter("pass"));
        if (studentDao.update(stu)) {
            request.setAttribute("student", stu);
            request.getRequestDispatcher("UpdateSuccess.jsp").forward(request, response);
        } else request.getRequestDispatcher("UpdateFail.jsp").forward(request, response);
    }
}
