package vn.edu.giadinh.tasksmanagement.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServelet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Hủy bỏ session hiện tại
    HttpSession session = request.getSession(false);
    if (session != null) {
      session.invalidate();
    }

    // Chuyển hướng về trang đăng nhập hoặc trang chủ
    request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
  }
}
