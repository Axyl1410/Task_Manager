<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập</title>
    <link
      rel="icon"
      href="https://nguyentruonggiang.id.vn/b11.webp"
      type="image/svg+xml"
    />
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <div class="flex h-screen w-full items-center justify-center px-4 lg:px-0">
      <div
        class="flex h-screen w-full grid-cols-2 items-center justify-center rounded-sm lg:grid"
      >
        <div class="flex w-full justify-center lg:px-5">
          <div
            class="flex w-full max-w-[532px] flex-col justify-center space-y-4"
          >
            <img
              class="size-10"
              src="https://nguyentruonggiang.id.vn/img/b11black.webp"
              alt="Your Company"
            />
            <h1 class="text-2xl font-bold">Sign in to your account</h1>
            <form
              class="space-y-2"
              action="${pageContext.request.contextPath}/login"
              method="post"
            >
              <div>
                <h2>Tên đăng nhập</h2>
                <input
                  class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  type="text"
                  name="username"
                  required
                />
              </div>
              <div>
                <h2>Mật khẩu</h2>
                <input
                  class="block w-full rounded-md border-0 bg-[#F2F2F2] p-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  type="password"
                  name="password"
                  required
                />
              </div>
              <div>
                <button
                  class="my-5 flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  type="submit"
                >
                  Đăng nhập
                </button>
              </div>
            </form>
            <div class="border-t">
              <div class="my-5 font-bold">Star for me:</div>
              <a
                href="https://github.com/Axyl1410/task_manager"
                target="_blank"
              >
                <button
                  class="mt-5 flex w-full items-center justify-center rounded-md border bg-[#F2F2F2] px-3 py-1.5 text-sm font-semibold leading-6 text-black shadow-sm focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2"
                >
                  <svg
                    class="size-5"
                    xmlns="http://www.w3.org/2000/svg"
                    x="0px"
                    y="0px"
                    viewBox="0 0 24 24"
                  >
                    <path
                      d="M10.9,2.1c-4.6,0.5-8.3,4.2-8.8,8.7c-0.5,4.7,2.2,8.9,6.3,10.5C8.7,21.4,9,21.2,9,20.8v-1.6c0,0-0.4,0.1-0.9,0.1 c-1.4,0-2-1.2-2.1-1.9c-0.1-0.4-0.3-0.7-0.6-1C5.1,16.3,5,16.3,5,16.2C5,16,5.3,16,5.4,16c0.6,0,1.1,0.7,1.3,1c0.5,0.8,1.1,1,1.4,1 c0.4,0,0.7-0.1,0.9-0.2c0.1-0.7,0.4-1.4,1-1.8c-2.3-0.5-4-1.8-4-4c0-1.1,0.5-2.2,1.2-3C7.1,8.8,7,8.3,7,7.6C7,7.2,7,6.6,7.3,6 c0,0,1.4,0,2.8,1.3C10.6,7.1,11.3,7,12,7s1.4,0.1,2,0.3C15.3,6,16.8,6,16.8,6C17,6.6,17,7.2,17,7.6c0,0.8-0.1,1.2-0.2,1.4 c0.7,0.8,1.2,1.8,1.2,3c0,2.2-1.7,3.5-4,4c0.6,0.5,1,1.4,1,2.3v2.6c0,0.3,0.3,0.6,0.7,0.5c3.7-1.5,6.3-5.1,6.3-9.3 C22,6.1,16.9,1.4,10.9,2.1z"
                    ></path>
                  </svg>
                  &nbsp; Github
                </button>
              </a>
            </div>
          </div>
        </div>
        <div class="hidden lg:block">
          <img
            class="h-screen object-cover"
            src="https://images.unsplash.com/photo-1496917756835-20cb06e75b4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1908&q=80"
            alt=""
          />
        </div>
      </div>
    </div>
  </body>
</html>
