<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>
<html>
<head>
  <title>Users</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/userdelete">
  <label>
    <input name="username"/>
  </label>
  <button type="submit">xoa</button>
</form>
</body>
</html>
