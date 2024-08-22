<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
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
      <div class="h-screen w-full">
        <div class="flex h-12 w-full items-center justify-center gap-4">
          <button
            class="flex items-center rounded-sm bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-500 active:bg-indigo-400"
          >
            Thêm người dùng &nbsp;
            <svg
              class="size-5"
              viewBox="0 0 32 32"
              xmlns="http://www.w3.org/2000/svg"
            >
              <defs>
                <style>
                  .cls-1 {
                    fill: none;
                    stroke: #fff;
                    stroke-linecap: round;
                    stroke-linejoin: round;
                    stroke-width: 2px;
                  }
                </style>
              </defs>
              <title />
              <g id="plus">
                <line class="cls-1" x1="16" x2="16" y1="7" y2="25" />
                <line class="cls-1" x1="7" x2="25" y1="16" y2="16" />
              </g>
            </svg>
          </button>
          <button
            class="flex items-center rounded-sm bg-red-600 px-4 py-2 text-white hover:bg-red-500 active:bg-red-400"
          >
            Xóa người dùng &nbsp;
            <svg
              class="size-4 fill-white"
              viewBox="0 0 448 512"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M432 80h-82.38l-34-56.75C306.1 8.827 291.4 0 274.6 0H173.4C156.6 0 141 8.827 132.4 23.25L98.38 80H16C7.125 80 0 87.13 0 96v16C0 120.9 7.125 128 16 128H32v320c0 35.35 28.65 64 64 64h256c35.35 0 64-28.65 64-64V128h16C440.9 128 448 120.9 448 112V96C448 87.13 440.9 80 432 80zM171.9 50.88C172.9 49.13 174.9 48 177 48h94c2.125 0 4.125 1.125 5.125 2.875L293.6 80H154.4L171.9 50.88zM352 464H96c-8.837 0-16-7.163-16-16V128h288v320C368 456.8 360.8 464 352 464zM224 416c8.844 0 16-7.156 16-16V192c0-8.844-7.156-16-16-16S208 183.2 208 192v208C208 408.8 215.2 416 224 416zM144 416C152.8 416 160 408.8 160 400V192c0-8.844-7.156-16-16-16S128 183.2 128 192v208C128 408.8 135.2 416 144 416zM304 416c8.844 0 16-7.156 16-16V192c0-8.844-7.156-16-16-16S288 183.2 288 192v208C288 408.8 295.2 416 304 416z"
              />
            </svg>
          </button>
        </div>
        <div class="w-full pt-4">
          <table class="w-full">
            <thead>
              <tr class="border border-indigo-600">
                <th class="w-1/3 border-r border-indigo-600 p-2">
                  Tên đăng nhập
                </th>

                <th class="w-1/3 border-r border-indigo-600 p-2">Họ và tên</th>

                <th class="w-1/3 p-2">Vai trò</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${requestScope.users}" var="user">
                <tr class="border-b border-indigo-600 even:bg-slate-200">
                  <td class="w-1/3 border-l border-indigo-600 p-2">
                    <c:out value="${user.username}" />
                  </td>
                  <td class="w-1/3 border-l border-indigo-600 p-2">
                    <c:out value="${user.fullName}" />
                  </td>
                  <td class="w-1/3 border-x border-indigo-600 p-2">
                    <c:out value="${user.role}" />
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
