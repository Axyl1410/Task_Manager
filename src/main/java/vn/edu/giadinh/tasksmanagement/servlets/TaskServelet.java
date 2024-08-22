package vn.edu.giadinh.tasksmanagement.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.giadinh.tasksmanagement.daos.TaskDBHandler;
import vn.edu.giadinh.tasksmanagement.models.Task;

@WebServlet("/tasks")
public class TaskServelet extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    try {
      List<Task> tasks = TaskDBHandler.getInstance().getAll();

      request.setAttribute("tasks", tasks);
      request.getRequestDispatcher("tasks.jsp").forward(request, response);
    } catch (SQLException e) {
      e.printStackTrace();
      out.println("Lỗi khi lấy dữ liệu tasks.");
    }
  }
}