package servlets;

import dao.BorrowDao;
import dao.StudentDao;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("user_name");
        String pass = req.getParameter("user_pass");
        Student student = new Student();
        student.setName(name);
        student.setPass(pass);
        StudentDao studentDao = new StudentDao();
        student = studentDao.add(student);
        if (student != null) {
            req.setAttribute("ID", String.valueOf(student.getId()));
            req.getRequestDispatcher("/RegisterSuccess.jsp").forward(req, resp);
        } else req.getRequestDispatcher("RegisterFail.jsp").forward(req, resp);
    }
}
