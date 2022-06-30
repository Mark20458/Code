package servlets;

import dao.StudentDao;
import model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignIn", value = "/SignIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int user_id = Integer.valueOf(request.getParameter("user_id"));
        String pass = request.getParameter("user_pass");
        Student stu = new Student();
        stu.setId(user_id);
        stu.setPass(pass);
        StudentDao studentDao = new StudentDao();
        stu = studentDao.checkExist(stu);
        System.out.println(stu);
        if (stu != null) {
            request.setAttribute("student", stu);
            request.getRequestDispatcher("SignInSuccess.jsp").forward(request, response);
        } else request.getRequestDispatcher("SignInFail.jsp").forward(request, response);
    }
}
