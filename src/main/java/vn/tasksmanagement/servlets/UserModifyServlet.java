package vn.tasksmanagement.servlets;

import vn.tasksmanagement.daos.UserDBHandler;
import vn.tasksmanagement.enums.UserRole;
import vn.tasksmanagement.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/modifyuser")
public class UserModifyServlet extends BaseServlet {
  public UserModifyServlet() {
    super();
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
      UserRole role;
//      UserRole role = UserRole.valueOf(request.getParameter("role"));

      User existingUser = userDBHandler.get(username);
      if (existingUser == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
      }

      if (password == null || password.isEmpty()) {
        password = existingUser.getPassword();
      }
      if (fullname == null || fullname.isEmpty()) {
        fullname = existingUser.getFullName();
      }

      String roleParam = request.getParameter("role");
      if (roleParam == null || roleParam.isEmpty()) {
        role = existingUser.getRole();
      } else {
        role = UserRole.valueOf(roleParam);
      }

      User user = new User(username, password, fullname, role);

      userDBHandler.update(user);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
