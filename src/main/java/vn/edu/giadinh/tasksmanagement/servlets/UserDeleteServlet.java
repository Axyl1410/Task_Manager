package vn.edu.giadinh.tasksmanagement.servlets;

import vn.edu.giadinh.tasksmanagement.daos.UserDBHandler;
import vn.edu.giadinh.tasksmanagement.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/userdelete")
public class UserDeleteServlet extends BaseServlet {

  public UserDeleteServlet() {
    super();
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    if (!isLoggedInUserAdmin(request)) {
      response.sendRedirect(request.getContextPath() + "/no-permission.jsp");
      return;
    }
//    request.getRequestDispatcher("/WEB-INF/userdelete.jsp").forward(request, response);
  }
//    if ("POST".equalsIgnoreCase(request.getMethod())) {
//      try {
//        String username = request.getParameter("username");
//        User user = new User();
//        user.setUsername(username);
//        UserDBHandler.getInstance().delete(user);
//        response.sendRedirect(request.getContextPath() + "/WEB-INF/users.jsp");
//      } catch (SQLException e) {
//        throw new RuntimeException(e);
//      }
//    }
//  }
}
