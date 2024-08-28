<%@ page import="vn.tasksmanagement.models.User" %>
<%@ page
  contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<meta charset="UTF-8"/>
<link
  rel="icon"
  href="https://nguyentruonggiang.id.vn/img/logowhite.webp"
  type="image/svg+xml"
/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
<style>
    .fade-in-out {
        opacity: 0;
        transition: opacity 0.5s ease-in-out;
    }

    .fade-in-out.active {
        opacity: 1;
    }

    .links {
        position: relative;
    }

    .links::after {
        content: "";
        position: absolute;
        left: 0;
        bottom: 0;
        height: 2px;
        width: 100%;
        background: #000;
        transform: scaleX(0);
        transform-origin: bottom right;
        transition: transform 0.3s;
    }

    .links:hover::after {
        transform: scaleX(1);
        transform-origin: bottom left;
    }
</style>
<body>
<%@ include file="./component/sidebar.jsp" %>
<div class="fade-in-out">
  <div class="h-screen overflow-hidden p-4 sm:ml-[240px]">
    <div
      class="flex h-[calc(100vh-72px)] w-full items-center justify-center"
    >
      <div class="w-full space-y-5">
        <h1 class="ani text-center text-2xl">
          Xin chào ${sessionScope.user} !
        </h1>
        <div class="flex flex-col items-center gap-2 sm:flex-row">
          <div
            class="ani flex h-[150px] w-1/3 flex-col items-center justify-center rounded-md border border-sky-400"
          >
            <svg
              class="size-8"
              xmlns="http://www.w3.org/2000/svg"
              x="0px"
              y="0px"
              viewBox="0 0 24 24"
            >
              <path
                d="M 12 2.0996094 L 1 12 L 4 12 L 4 21 L 11 21 L 11 15 L 13 15 L 13 21 L 20 21 L 20 12 L 23 12 L 12 2.0996094 z M 12 4.7910156 L 18 10.191406 L 18 11 L 18 19 L 15 19 L 15 13 L 9 13 L 9 19 L 6 19 L 6 10.191406 L 12 4.7910156 z"
              ></path>
            </svg>
            <h1>Dashboard</h1>
          </div>
          <div
            class="ani flex h-[150px] w-1/3 flex-col items-center justify-center rounded-md border border-sky-400"
          >
            <svg
              class="size-8"
              enable-background="new 0 0 512 512"
              id="Layer_1"
              version="1.1"
              viewBox="0 0 512 512"
              xml:space="preserve"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
                  <path
                    d="M449.441,393.818V178.852c0-31.555-27.967-57.236-62.365-57.236H369.99v-3.434c0-31.566-27.967-57.236-62.365-57.236  h-23.034H152.586h-27.661c-34.388,0-62.365,25.67-62.365,57.236v214.965c0,31.555,27.978,57.236,62.365,57.236h17.084v3.435  c0,31.565,27.978,57.235,62.366,57.235h27.661h132.005h11.867h11.167C421.474,451.053,449.441,425.384,449.441,393.818z   M364.041,432.318H232.036h-27.661c-23.177,0-41.956-17.237-41.956-38.5v-3.435v-18.736V178.852c0-21.263,18.779-38.5,41.956-38.5  h27.661h117.545h14.46h5.949h17.085c23.177,0,41.956,17.237,41.956,38.5v214.966c0,21.263-18.779,38.5-41.956,38.5h-11.167H364.041z  "
                  />
              <path
                d="M197.397,214.935h162.334c4.484,0,8.115-3.632,8.115-8.116s-3.631-8.115-8.115-8.115H197.397  c-4.484,0-8.116,3.631-8.116,8.115S192.913,214.935,197.397,214.935z"
              />
              <path
                d="M223.046,261.967c0,4.484,3.642,8.115,8.126,8.115h152.119c4.484,0,8.126-3.631,8.126-8.115s-3.642-8.127-8.126-8.127  H231.172C226.688,253.84,223.046,257.482,223.046,261.967z"
              />
              <path
                d="M348.083,317.102c0-4.484-3.632-8.116-8.116-8.116h-142.57c-4.484,0-8.116,3.632-8.116,8.116s3.631,8.126,8.116,8.126  h142.57C344.451,325.228,348.083,321.587,348.083,317.102z"
              />
              <path
                d="M391.417,372.249c0-4.484-3.642-8.115-8.126-8.115H249.689c-4.484,0-8.116,3.631-8.116,8.115s3.631,8.116,8.116,8.116  h133.602C387.776,380.365,391.417,376.733,391.417,372.249z"
              />
                </svg>
            <h1>Tasks</h1>
          </div>
          <div
            class="ani flex h-[150px] w-1/3 flex-col items-center justify-center rounded-md border border-sky-400"
          >
            <svg
              class="size-8"
              version="1.1"
              id="_x32_"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              viewBox="0 0 512 512"
              xml:space="preserve"
            >
                  <g>
                    <path
                      class="st0"
                      d="M435.95,287.525c32.51,0,58.87-26.343,58.87-58.853c0-32.51-26.361-58.871-58.87-58.871c-32.502,0-58.863,26.361-58.863,58.871C377.088,261.182,403.448,287.525,435.95,287.525z"
                    />
                    <path
                      class="st0"
                      d="M511.327,344.251c-2.623-15.762-15.652-37.822-25.514-47.677c-1.299-1.306-7.105-1.608-8.673-0.636c-11.99,7.374-26.074,11.714-41.19,11.714c-15.099,0-29.184-4.34-41.175-11.714c-1.575-0.972-7.373-0.67-8.672,0.636c-2.757,2.757-5.765,6.427-8.698,10.683c7.935,14.94,14.228,30.81,16.499,44.476c2.27,13.7,1.533,26.67-2.138,38.494c13.038,4.717,28.673,6.787,44.183,6.787C476.404,397.014,517.804,382.987,511.327,344.251z"
                    />
                    <path
                      class="st0"
                      d="M254.487,262.691c52.687,0,95.403-42.716,95.403-95.402c0-52.67-42.716-95.386-95.403-95.386c-52.678,0-95.378,42.716-95.378,95.386C159.109,219.975,201.808,262.691,254.487,262.691z"
                    />
                    <path
                      class="st0"
                      d="M335.269,277.303c-2.07-2.061-11.471-2.588-14.027-1.006c-19.448,11.966-42.271,18.971-66.755,18.971c-24.466,0-47.3-7.005-66.738-18.971c-2.555-1.583-11.956-1.055-14.026,1.006c-16.021,16.004-37.136,51.782-41.384,77.288c-10.474,62.826,56.634,85.508,122.148,85.508c65.532,0,132.639-22.682,122.165-85.508C372.404,329.085,351.289,293.307,335.269,277.303z"
                    />
                    <path
                      class="st0"
                      d="M76.049,287.525c32.502,0,58.862-26.343,58.862-58.853c0-32.51-26.36-58.871-58.862-58.871c-32.511,0-58.871,26.361-58.871,58.871C17.178,261.182,43.538,287.525,76.049,287.525z"
                    />
                    <path
                      class="st0"
                      d="M115.094,351.733c2.414-14.353,9.225-31.253,17.764-46.88c-2.38-3.251-4.759-6.083-6.955-8.279c-1.299-1.306-7.097-1.608-8.672-0.636c-11.991,7.374-26.076,11.714-41.182,11.714c-15.108,0-29.202-4.34-41.183-11.714c-1.568-0.972-7.382-0.67-8.681,0.636c-9.887,9.854-22.882,31.915-25.514,47.677c-6.468,38.736,34.924,52.762,75.378,52.762c14.437,0,29.016-1.777,41.459-5.84C113.587,379.108,112.757,365.835,115.094,351.733z"
                    />
                  </g>
                </svg>
            <h1>Users</h1>
          </div>
        </div>
      </div>
    </div>
    <div
      class="flex h-10 w-full flex-wrap items-center justify-between font-semibold"
    >
      <div class="ani">
        <a
          class="links relative inline-block"
          href="https://nguyentruonggiang.id.vn/"
          translate="no"
        >Axyl</a
        >
      </div>
      <div class="ani">
        Copyright © 2024 <span translate="no">Axyl</span>. All rights
        reserved.
      </div>
    </div>
  </div>
</div>
<script>
  gsap.fromTo(
      [".ani"],
      {y: 50, opacity: 0},
      {y: 0, opacity: 1, stagger: 0.15, duration: 1, ease: "power3.out"}
  );
</script>
<script>
  window.addEventListener("load", () => {
    let pageContent = document.querySelector(".fade-in-out");
    pageContent.classList.add("active");
  });
</script>
</body>
</html>
