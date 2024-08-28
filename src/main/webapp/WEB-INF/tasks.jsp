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
      href="https://nguyentruonggiang.id.vn/img/logowhite.webp"
      type="image/svg+xml"
    />
    <style>
      #toggle {
        max-height: 1320px;
        overflow: hidden;
        transition: max-height 0.8s ease-in-out;
      }

      #toggle.hidden1 {
        max-height: 0;
      }

      .fade-in-out {
        opacity: 0;
        transition: opacity 0.5s ease-in-out;
      }

      .fade-in-out.active {
        opacity: 1;
      }
    </style>
  </head>
  <body>
    <c:if test="${empty requestScope.tasks and requestScope.tasks.isEmpty()}">
      <jsp:forward page="${pageContext.request.contextPath}/error.jsp" />
    </c:if>
    <%@ include file="../component/sidebar.jsp" %>
    <div class="fade-in-out">
      <div class="ml-[240px] p-4">
        <div class="w-full">
          <div class="w-full border-b border-slate-500 pb-4">
            <h1 class="text-2xl font-bold">Want to make modify?</h1>
            <button
              class="mt-2 flex items-center rounded-sm bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-500 active:bg-indigo-400"
              id="togglebtn"
            >
              Click me
            </button>
          </div>
          <div class="hidden1 pt-2" id="toggle">
            <p class="pb-4 text-2xl font-bold">Danger Zone</p>
            <div class="w-full gap-4 border border-red-500 pb-4">
              <div class="w-full border-b border-slate-500 p-4">
                <p class="pb-2 text-xl font-bold">Add task</p>
                <div class="pb-2">
                  <p>Title</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addtitle"
                  />
                </div>
                <div class="pb-2">
                  <p>Description</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="adddescription"
                  />
                </div>
                <div>
                  <p>Status</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addstatus"
                  />
                </div>
                <div>
                  <p>Progress</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addprogress"
                  />
                </div>
                <div>
                  <p>Responsibility</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addresponsibility"
                  />
                </div>
                <div>
                  <p>Tester</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addtester"
                  />
                </div>
                <button
                  class="mt-2 flex items-center rounded-sm bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-500 active:bg-indigo-400"
                  onclick="const addtitle = document.getElementById('addtitle').value; const adddescription = document.getElementById('adddescription').value; const addstatus = document.getElementById('addstatus').value; const addprogress = document.getElementById('addprogress').value; const addresponsibility = document.getElementById('addresponsibility').value; const addtester = document.getElementById('addtester').value; addtask(addtitle,adddescription,addstatus,addprogress,addresponsibility,addtester)"
                >
                  Add task &nbsp;
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
              </div>
              <div class="w-full border-b border-slate-500 p-4">
                <p class="pb-2 text-xl font-bold">Remove task</p>
                <div class="pb-2">
                  <p>id</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    name="username"
                    id="username"
                  />
                </div>
                <button
                  class="flex items-center rounded-sm bg-red-600 px-4 py-2 text-white hover:bg-red-500 active:bg-red-400"
                  onclick="const id = document.getElementById('username').value; deletetask(id)"
                >
                  Remove Task &nbsp;
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
              <div class="w-full p-4 pb-0">
                <p class="pb-2 text-xl font-bold">Modify task</p>
                <div class="pb-2">
                  <p>id</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifyid"
                  />
                </div>
                <div class="pb-2">
                  <p>Title</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifytitle"
                  />
                </div>
                <div class="pb-2">
                  <p>Description</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifydescription"
                  />
                </div>
                <div>
                  <p>Status</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifystatus"
                  />
                </div>
                <div>
                  <p>Progress</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifyprogress"
                  />
                </div>
                <div>
                  <p>Responsibility</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifyresponsibility"
                  />
                </div>
                <div>
                  <p>Tester</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifytester"
                  />
                </div>
                <button
                  class="mt-2 flex items-center rounded-sm bg-sky-600 px-4 py-2 text-white hover:bg-sky-500 active:bg-sky-400"
                  onclick="const idtitle=document.getElementById('modifyid').value; const modifytitle = document.getElementById('modifytitle').value; const modifydescription = document.getElementById('modifydescription').value; const modifystatus = document.getElementById('modifystatus').value; const modifyprogress = document.getElementById('modifyprogress').value; const modifyresponsibility = document.getElementById('modifyresponsibility').value; const modifytester = document.getElementById('modifytester').value; modifytask(idtitle,modifytitle,modifydescription,modifystatus,modifyprogress,modifyresponsibility,modifytester)"
                >
                  modify &nbsp;
                  <svg
                    class="size-3 fill-white stroke-white"
                    version="1.1"
                    viewBox="0 0 18 18"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <desc />
                    <defs />
                    <g
                      fill="#fff"
                      fill-rule="evenodd"
                      id="Page-1"
                      stroke="none"
                      stroke-width="1"
                    >
                      <g
                        fill="#fff"
                        id="Core"
                        transform="translate(-213.000000, -129.000000)"
                      >
                        <g
                          id="create"
                          transform="translate(213.000000, 129.000000)"
                        >
                          <path
                            d="M0,14.2 L0,18 L3.8,18 L14.8,6.9 L11,3.1 L0,14.2 L0,14.2 Z M17.7,4 C18.1,3.6 18.1,3 17.7,2.6 L15.4,0.3 C15,-0.1 14.4,-0.1 14,0.3 L12.2,2.1 L16,5.9 L17.7,4 L17.7,4 Z"
                            id="Shape"
                          />
                        </g>
                      </g>
                    </g>
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
                <div class="w-full border-x border-indigo-600 p-2">
                  <c:out value="id : ${task.id} -" />
                  <c:out value="Description : ${task.description}" />
                </div>
                <tbody>
                  <tr class="odd:bg-slate-200">
                    <td class="w-1/5 border border-indigo-600 p-2">
                      <c:out value="${task.title}" />
                    </td>
                    <td class="w-1/5 border-r border-y border-indigo-600 p-2">
                      <c:out value="${task.status}" />
                    </td>
                    <td class="w-1/5 border-r border-y border-indigo-600 p-2">
                      <c:out value="${task.progress}" />
                    </td>
                    <td class="w-1/5 border-r border-y border-indigo-600 p-2">
                      <c:out value="${task.responsibility}" />
                    </td>
                    <td class="w-1/5 border-r border-y border-indigo-600 p-2">
                      <c:out value="${task.tester}" />
                    </td>
                  </tr>
                </tbody>
              </table>
            </c:forEach>
          </div>
        </div>
      </div>
      <p class="ml-[240px] flex h-[3rem] items-center p-4 pb-8">
        Copyright © 2024 Axyl. All rights reserved
      </p>
    </div>
    <%@include file="../component/backtotop.jsp" %>
    <script>
      const addtask = (
        title,
        description,
        status,
        progress,
        responsibility,
        tester
      ) => {
        if (title == "" || description == "" || status == "" || progress == "")
          alert("Please enter all fields");
        else if (confirm("Are you sure to add this task?")) {
          fetch("addtask", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
              title: title,
              description: description,
              status: status,
              progress: progress,
              responsibility: responsibility,
              tester: tester,
            }),
          }).then((response) => {
            if (response.ok) {
              alert("Add task success");
              window.location.reload();
            } else alert("Add task fail");
          });
        } else alert("Add task cancel");
      };

      const deletetask = (id) => {
        if (id == "") alert("Please enter id");
        else if (confirm("Are you sure to delete this task?")) {
          fetch("deletetask", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
              id: id,
            }),
          }).then((response) => {
            if (response.ok) {
              alert("Delete task success");
              window.location.reload();
            } else alert("Delete task fail");
          });
        } else alert("Delete task cancel");
      };

      const modifytask = (
        id,
        title,
        description,
        status,
        progress,
        responsibility,
        tester
      ) => {
        if (id == "") alert("Please enter id");
        else if (confirm("Are you sure to modify this task?")) {
          fetch("modifytask", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
              id: id,
              title: title,
              description: description,
              status: status,
              progress: progress,
              responsibility: responsibility,
              tester: tester,
            }),
          }).then((response) => {
            if (response.ok) {
              alert("Modify task success");
              window.location.reload();
            } else alert("Modify task fail");
          });
        } else alert("Modify task cancel");
      };

      const toggle = document.getElementById("toggle");
      const btn = document.getElementById("togglebtn");

      btn.addEventListener("click", () => {
        toggle.classList.toggle("hidden1");
      });
    </script>
    <script>
      window.addEventListener("load", () => {
        let pageContent = document.querySelector(".fade-in-out");
        pageContent.classList.add("active");
      });
    </script>
  </body>
</html>
