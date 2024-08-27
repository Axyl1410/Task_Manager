<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<html>
  <head>
    <title>Danh sách người dùng</title>
    <link
      rel="icon"
      href="https://nguyentruonggiang.id.vn/img/logowhite.webp"
      type="image/svg+xml"
    />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      #toggle {
        max-height: 1200px;
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
    <c:if test="${empty requestScope.users and requestScope.users.isEmpty()}">
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
              onclick="togglehidden()"
              id="togglebtn"
            >
              Click me
            </button>
          </div>
          <div class="hidden1 pt-2" id="toggle">
            <p class="pb-4 text-2xl font-bold">Danger Zone</p>
            <div class="w-full gap-4 border border-red-500 pb-4">
              <div class="w-full border-b border-slate-500 p-4">
                <p class="pb-2 text-xl font-bold">Add user</p>
                <div class="pb-2">
                  <p>Username</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addUsername"
                  />
                </div>
                <div class="pb-2">
                  <p>Fullname</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addFullname"
                  />
                </div>
                <div>
                  <p>password</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addPassword"
                  />
                </div>
                <div>
                  <p>role</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="addrole"
                  />
                </div>
                <button
                  class="mt-2 flex items-center rounded-sm bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-500 active:bg-indigo-400"
                  onclick="const addusername = document.getElementById('addUsername').value; const addfullname = document.getElementById('addFullname').value; const addpassword = document.getElementById('addPassword').value; const addrole = document.getElementById('addrole').value; addUser(addusername, addfullname, addpassword,addrole)"
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
              </div>
              <div class="w-full border-b border-slate-500 p-4">
                <p class="pb-2 text-xl font-bold">Remove user</p>
                <div class="pb-2">
                  <p>Username</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="deleteUser"
                  />
                </div>
                <button
                  class="flex items-center rounded-sm bg-red-600 px-4 py-2 text-white hover:bg-red-500 active:bg-red-400"
                  onclick="const id = document.getElementById('deleteUser').value; deleteUser(id)"
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
              <div class="w-full p-4 pb-0">
                <p class="pb-2 text-xl font-bold">modify user</p>
                <div class="pb-2">
                  <p>Username</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifyusername"
                  />
                </div>
                <div class="pb-2">
                  <p>Fullname</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifyfullname"
                  />
                </div>
                <div>
                  <p>password</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifypassword"
                  />
                </div>
                <div>
                  <p>role</p>
                  <input
                    class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    type="text"
                    id="modifyrole"
                  />
                </div>
                <button
                  class="mt-2 flex items-center rounded-sm bg-sky-600 px-4 py-2 text-white hover:bg-sky-500 active:bg-sky-400"
                  onclick="const modifypassword = document.getElementById('modifypassword').value ; const modifyfullname = document.getElementById('modifyfullname').value ; const modifyrole = document.getElementById('modifyrole').value ; const modifyusername = document.getElementById('modifyusername').value ; modifyUser(modifyusername,modifyfullname,modifypassword,modifyrole,modifyusername)"
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
          <div class="w-full pt-4">
            <table class="w-full">
              <thead>
                <tr class="border border-indigo-600">
                  <th class="w-1/3 border-r border-indigo-600 p-2">
                    Tên đăng nhập
                  </th>

                  <th class="w-1/3 border-r border-indigo-600 p-2">
                    Họ và tên
                  </th>

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
    </div>
    <script>
      let addUser = (username, fullname, password, role) => {
        if (username == "" || fullname == "" || password == "" || role == "")
          alert("missing information");
        else if (confirm("Are you sure you want to add this user?")) {
          fetch("adduser", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
              username: username,
              fullname: fullname,
              password: password,
              role: role,
            }),
          }).then((response) => {
            if (response.ok) {
              alert("Add user success");
              window.location.reload();
            } else alert("Add user fail");
          });
        } else alert("Add user cancel");
      };

      let deleteUser = (id) => {
        if (id == "") alert("missing information");
        else if (confirm("Are you sure you want to delete this user?")) {
          fetch("deleteuser", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
              username: id,
            }),
          }).then((response) => {
            if (response.ok) {
              alert("Delete user success");
              window.location.reload();
            } else alert("Delete user fail");
          });
        } else alert("Delete user cancel");
      };

      let modifyUser = (username, fullname, password, role) => {
        if (username == "") alert("Please input username");
        else if (confirm("Are you sure you want to modify this user?")) {
          fetch("modifyuser", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
              username: username,
              fullname: fullname,
              password: password,
              role: role,
            }),
          }).then((response) => {
            if (response.ok) {
              alert("Modify user success");
              window.location.reload();
            } else alert("Modify user fail");
          });
        } else alert("Modify user cancel");
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
