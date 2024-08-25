package vn.edu.giadinh.tasksmanagement.servlets;

import vn.edu.giadinh.tasksmanagement.daos.TaskDBHandler;
import vn.edu.giadinh.tasksmanagement.models.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deletetask")
public class TaskDeleteServlet extends HttpServlet {
  public TaskDeleteServlet() {
    super();
  }

  private final TaskDBHandler taskDBHandler = TaskDBHandler.getInstance();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      int id = Integer.parseInt(request.getParameter("id"));

      Task existingTask = taskDBHandler.get(id);
      if (existingTask == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
      }
      Task task = new Task(id);
      taskDBHandler.delete(task);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
