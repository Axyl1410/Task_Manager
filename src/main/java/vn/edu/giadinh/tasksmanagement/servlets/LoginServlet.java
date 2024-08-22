package vn.edu.giadinh.tasksmanagement.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.edu.giadinh.tasksmanagement.models.User;

@WebServlet("/login")
public class LoginServlet extends BaseServlet {

  // Constructor
  public LoginServlet() {
    super();
  }

  // Methods
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    handleLogin(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    handleLogin(req, resp);
  }

  private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // Kiểm tra đã đăng nhập hay chưa
    User user = getLoggedInUser(req);
    if (user != null) {
      // Chuyển hướng đến trang chính
      resp.sendRedirect(req.getContextPath() + "/index.jsp");
      return;
    }

    // Trường hợp chưa đăng nhập, hoặc đăng nhập không thành công từ POST

    // Nếu là POST request, lấy username và password
    String username = null;
    String password = null;
    if ("POST".equalsIgnoreCase(req.getMethod())) {
      username = req.getParameter("username");
      password = req.getParameter("password");

      // Kiểm tra nếu 1 trong 2 rỗng thì quay về trang đăng nhập
      if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
        req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin đăng nhập.");
        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
        return;
      }

      try {
        // Truy xuất người dùng dựa trên username đã cung cấp
        user = userDBHandler.get(username);

        // Trường hợp người dùng không tồn tại hoặc mật khẩu không khớp
        if (user == null || !password.equals(user.getPassword())) {
          req.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu.");
          req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
          return;
        }

      } catch (Exception e) {
        e.printStackTrace();
        resp.sendRedirect(req.getContextPath() + "/error.jsp");
        return;
      }
    }

    // Nếu đăng nhập thành công hoặc là GET request, lưu username vào session
    if (user != null) {
      HttpSession session = req.getSession();
      session.setAttribute("user", user.getUsername());

      // Chuyển hướng đến trang chính
      resp.sendRedirect(req.getContextPath() + "/index.jsp");
      return;
    }

    // Nếu chưa có user (chưa đăng nhập hoặc đăng nhập thất bại), hiển thị trang
    // login
    req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
  }
}