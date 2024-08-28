package vn.tasksmanagement.servlets;

import vn.tasksmanagement.daos.UserDBHandler;
import vn.tasksmanagement.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteuser")
public class UserDeleteServlet extends BaseServlet {
  public UserDeleteServlet() {
    super();
  }

  private final UserDBHandler userDBHandler = UserDBHandler.getInstance();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    if (!isLoggedInUserAdmin(request)) {
      response.sendRedirect(request.getContextPath() + "/no-permission.jsp");
      return;
    }

    try {
      String username = request.getParameter("username");
      User currentUser = getLoggedInUser(request);

      if (currentUser != null && currentUser.getUsername().equals(username)) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Không thể xóa chính mình");
        return;
      }

      User existingUser = userDBHandler.get(username);
      if (existingUser == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
      }

      User userToDelete = new User();
      userToDelete.setUsername(username);

      userDBHandler.delete(userToDelete);
      response.sendRedirect("index.jsp");
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}