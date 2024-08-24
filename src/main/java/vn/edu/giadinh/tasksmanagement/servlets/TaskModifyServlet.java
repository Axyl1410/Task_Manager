package vn.edu.giadinh.tasksmanagement.servlets;

import vn.edu.giadinh.tasksmanagement.daos.TaskDBHandler;
import vn.edu.giadinh.tasksmanagement.enums.TaskProgress;
import vn.edu.giadinh.tasksmanagement.enums.TaskStatus;
import vn.edu.giadinh.tasksmanagement.models.Task;
import vn.edu.giadinh.tasksmanagement.models.User;

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

  TaskDBHandler taskDBHandler = TaskDBHandler.getInstance();

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

      if (title == null || title.equals("")) {
        title = existingTask.getTitle();
      }
      if (description == null || description.equals("")) {
        description = existingTask.getDescription();
      }
      if (responsibility == null || responsibility.equals("")) {
        responsibility = existingTask.getResponsibility();
      }
      if (tester == null || tester.equals("")) {
        tester = existingTask.getTester();
      }

      String statusParem = request.getParameter("status");
      if (status == null || status.equals("")) {
        status = existingTask.getStatus();
      } else {
        status = TaskStatus.valueOf(statusParem);
      }

      String progressParem = request.getParameter("progress");
      if (progress == null || progress.equals("")) {
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
