package vn.tasksmanagement.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response,
                       FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse resp = (HttpServletResponse) response;
    HttpSession session = req.getSession(false);

    String requestURI = req.getRequestURI();

    // Kiểm tra nếu người dùng đã đăng nhập
    boolean isLoggedIn = session != null && session.getAttribute("user") != null;

    // Kiểm tra nếu là yêu cầu đến trang login
    boolean isLoginPageRequest = requestURI.endsWith("/login") || requestURI.endsWith("/login.jsp");

    // Nếu chưa đăng nhập và không phải là yêu cầu đến trang login
    if (!isLoggedIn && !isLoginPageRequest) {
      // Chuyển hướng đến trang login
      req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
      return;
    }

    chain.doFilter(request, response); // Cho phép yêu cầu tiếp tục
  }
}