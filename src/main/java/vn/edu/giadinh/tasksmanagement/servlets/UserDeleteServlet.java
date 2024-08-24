package vn.edu.giadinh.tasksmanagement.servlets;

import vn.edu.giadinh.tasksmanagement.daos.UserDBHandler;
import vn.edu.giadinh.tasksmanagement.models.User;

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

  private UserDBHandler userDBHandler = UserDBHandler.getInstance();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    if (!isLoggedInUserAdmin(request)) {
      response.sendRedirect(request.getContextPath() + "/no-permission.jsp");
      return;
    }

    try {
      String username = request.getParameter("username");
      System.out.println(username);
      User userToDelete = new User();
      userToDelete.setUsername(username);

      userDBHandler.delete(userToDelete);
      response.sendRedirect("index.jsp");
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}