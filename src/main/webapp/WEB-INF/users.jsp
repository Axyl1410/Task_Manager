<%-- Created by IntelliJ IDEA. User: lequochai Date: 8/17/2024 Time: 8:40 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>Danh sách người dùng</title>
    <link
      rel="icon"
      href="https://nguyentruonggiang.id.vn/b11.webp"
      type="image/svg+xml"
    />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <%-- Trường hợp không có danh sách người dùng thì chuyển hướng về trang
    lỗi--%>
    <c:if test="${empty requestScope.users and requestScope.users.isEmpty()}">
      <jsp:forward page="${pageContext.request.contextPath}/error.jsp" />
    </c:if>

    <%-- Trường hợp có danh sách người dùng thì in ra bảng danh sách nguười
    dùng--%> <%@ include file="../component/sidebar.jsp" %>
    <div class="ml-[240px] p-4">
      <table>
        <thead>
          <tr>
            <th>Tên đăng nhập</th>

            <th>Họ và tên</th>

            <th>Vai trò</th>
          </tr>
        </thead>

        <tbody>
          <c:forEach items="${requestScope.users}" var="user">
            <tr>
              <td>
                <c:out value="${user.username}" />
              </td>

              <td>
                <c:out value="${user.fullName}" />
              </td>

              <td>
                <c:out value="${user.role}" />
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
