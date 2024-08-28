package vn.tasksmanagement.servlets;

import vn.tasksmanagement.daos.TaskDBHandler;
import vn.tasksmanagement.enums.TaskProgress;
import vn.tasksmanagement.enums.TaskStatus;
import vn.tasksmanagement.models.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/modifytask")
public class TaskModifyServlet extends HttpServlet {
  public TaskModifyServlet() {
    super();
  }

  private final TaskDBHandler taskDBHandler = TaskDBHandler.getInstance();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      int id = Integer.parseInt(request.getParameter("id"));
      String title = request.getParameter("title");
      String description = request.getParameter("description");
      TaskStatus status = null;
      TaskProgress progress = null;
      String responsibility = request.getParameter("responsibility");
      String tester = request.getParameter("tester");

      Task existingTask = taskDBHandler.get(id);
      if (existingTask == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
      }

      if (title == null || title.isEmpty()) {
        title = existingTask.getTitle();
      }
      if (description == null || description.isEmpty()) {
        description = existingTask.getDescription();
      }
      if (responsibility == null || responsibility.isEmpty()) {
        responsibility = existingTask.getResponsibility();
      }
      if (tester == null || tester.isEmpty()) {
        tester = existingTask.getTester();
      }

      String statusParem = request.getParameter("status");
      if (statusParem == null || statusParem.isEmpty()) {
        status = existingTask.getStatus();
      } else {
        status = TaskStatus.valueOf(statusParem);
      }

      String progressParem = request.getParameter("progress");
      if (progressParem == null || progressParem.isEmpty()) {
        progress = existingTask.getProgress();
      } else {
        progress = TaskProgress.valueOf(progressParem);
      }

      Task task = new Task(id, title, description, status, progress, responsibility, tester);

      taskDBHandler.update(task);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
