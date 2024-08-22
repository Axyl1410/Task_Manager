<%@ page import="vn.edu.giadinh.tasksmanagement.models.User" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
  <meta charset="UTF-8" />
  <link
    rel="icon"
    href="https://nguyentruonggiang.id.vn/b11.webp"
    type="image/svg+xml"
  />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <body>
    <%@ include file="./component/sidebar.jsp" %>
    <h2 class="ml-[240px] p-4">xin chào ${sessionScope.user} !</h2>
    <a class="ml-[240px] p-4" href="${pageContext.request.contextPath}/logout"
      >Đăng xuất</a
    >
  </body>
</html>
