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
      TaskStatus status = TaskStatus.valueOf(request.getParameter("status"));
      TaskProgress progress = TaskProgress.valueOf(request.getParameter("progress"));
      String responsibility = request.getParameter("responsibility");
      String tester = request.getParameter("tester");

      Task task = new Task(id, title, description, status, progress, responsibility, tester);


      taskDBHandler.update(task);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
