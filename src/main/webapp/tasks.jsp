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
      <div class="w-full">
        <div>
          <p class="pb-4 text-2xl font-bold">Danger Zone</p>
          <div class="w-full gap-4 border border-red-500 pb-4">
            <div class="w-full border-b border-slate-500 p-4">
              <p class="pb-2 text-xl font-bold">Remove task</p>
              <form action="post">
                <div class="pb-2">
                  <p>title</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    name="title"
                  />
                </div>
              </form>
              <button
                class="flex items-center rounded-sm bg-red-600 px-4 py-2 text-white hover:bg-red-500 active:bg-red-400"
              >
                Xóa task &nbsp;
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
          </div>
        </div>
        <div class="pt-4">
          <table class="w-full">
            <thead>
              <tr class="border-y border-indigo-600">
                <th class="w-1/5 border-x border-indigo-600 p-2">Title</th>
                <th class="w-1/5 border-r border-indigo-600 p-2">Status</th>
                <th class="w-1/5 border-r border-indigo-600 p-2">Progress</th>
                <th class="w-1/5 border-r border-indigo-600 p-2">
                  Responsibility
                </th>
                <th class="w-1/5 border-r border-indigo-600 p-2">Tester</th>
              </tr>
            </thead>
          </table>
          <c:forEach items="${requestScope.tasks}" var="task">
            <table class="w-full">
              <tbody>
                <tr class="odd:bg-slate-200">
                  <td class="w-1/5 border-x border-indigo-600 p-2">
                    <c:out value="${task.title}" />
                  </td>
                  <td class="w-1/5 border-r border-indigo-600 p-2">
                    <c:out value="${task.status}" />
                  </td>
                  <td class="w-1/5 border-r border-indigo-600 p-2">
                    <c:out value="${task.progress}" />
                  </td>
                  <td class="w-1/5 border-r border-indigo-600 p-2">
                    <c:out value="${task.responsibility}" />
                  </td>
                  <td class="w-1/5 border-r border-indigo-600 p-2">
                    <c:out value="${task.tester}" />
                  </td>
                </tr>
              </tbody>
            </table>
            <div class="w-full border border-indigo-600 p-2">
              <c:out value="Description : ${task.description}" />
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </body>
</html>
