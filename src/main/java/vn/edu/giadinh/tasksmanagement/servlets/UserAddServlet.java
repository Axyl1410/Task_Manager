package vn.edu.giadinh.tasksmanagement.servlets;

import vn.edu.giadinh.tasksmanagement.daos.UserDBHandler;
import vn.edu.giadinh.tasksmanagement.enums.UserRole;
import vn.edu.giadinh.tasksmanagement.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/adduser")
public class UserAddServlet extends BaseServlet {
  public UserAddServlet() {
  }

  private final UserDBHandler userDBHandler = UserDBHandler.getInstance();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    if (!isLoggedInUserAdmin(request)) {
      response.sendRedirect(request.getContextPath() + "/no-permission.jsp");
      return;
    }

    try {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String fullname = request.getParameter("fullname");
      UserRole role = UserRole.valueOf(request.getParameter("role"));

      User user = new User(username, password, fullname, role);

      userDBHandler.insert(user);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
