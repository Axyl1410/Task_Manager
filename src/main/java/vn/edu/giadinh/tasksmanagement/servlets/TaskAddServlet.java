package vn.edu.giadinh.tasksmanagement.servlets;

import vn.edu.giadinh.tasksmanagement.daos.TaskDBHandler;
import vn.edu.giadinh.tasksmanagement.enums.TaskProgress;
import vn.edu.giadinh.tasksmanagement.enums.TaskStatus;
import vn.edu.giadinh.tasksmanagement.models.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addtask")
public class TaskAddServlet extends HttpServlet {
  public TaskAddServlet() {
    super();
  }

  private final TaskDBHandler taskDBHandler = TaskDBHandler.getInstance();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      String title = request.getParameter("title");
      String description = request.getParameter("description");
      TaskStatus status = TaskStatus.valueOf(request.getParameter("status"));
      TaskProgress progress = TaskProgress.valueOf(request.getParameter("progress"));
      String responsibility = request.getParameter("responsibility");
      String tester = request.getParameter("tester");

      Task task;
      if (responsibility == null || responsibility.isEmpty() && tester == null || tester.isEmpty()) {
        task = new Task(title, description, status, progress);
      } else if (responsibility == null || responsibility.isEmpty()) {
        task = new Task(title, description, status, progress, null, tester);
      } else if (tester == null || tester.isEmpty()) {
        task = new Task(title, description, status, progress, responsibility, null);
      } else {
        task = new Task(title, description, status, progress, responsibility, tester);
      }
      taskDBHandler.insert(task);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
