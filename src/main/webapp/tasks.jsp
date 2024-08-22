<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<html>
  <head>
    <title>tasks</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link
      rel="icon"
      href="https://nguyentruonggiang.id.vn/b11.webp"
      type="image/svg+xml"
    />
  </head>
  <body>
    <c:if test="${empty requestScope.tasks and requestScope.tasks.isEmpty()}">
      <jsp:forward page="${pageContext.request.contextPath}/error.jsp" />
    </c:if>

    <%@ include file="./component/sidebar.jsp" %>
    <div class="ml-[240px] p-4">
      <c:forEach var="tasks" items="${requestScope.tasks}">
        <c:out value="${tasks.title}" />
      </c:forEach>
    </div>
  </body>
</html>
