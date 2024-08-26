<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>404</title>
    <link
      rel="icon"
      href="https://nguyentruonggiang.id.vn/img/logoblue.webp"
      type="image/svg+xml"
    />
    <style>
      .content h2.header:after {
        content: attr(data-text);
        background: repeating-linear-gradient(
          -45deg,
          #71b7e6,
          #69a6ce,
          #b98acc,
          #ee8176,
          #b98acc,
          #69a6ce,
          #9b59b6
        );
        background-size: 400%;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.25);

        @media (prefers-color-scheme: dark) {
          text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.8);
        }

        animation: animate 10s ease-in-out infinite;
      }

      @keyframes animate {
        0%,
        100% {
          background-position: 0 0;
        }
        25% {
          background-position: 100% 0;
        }
        50% {
          background-position: 100% 100%;
        }
        75% {
          background-position: 0% 100%;
        }
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
    <div
      class="container-error fade-in-out flex h-screen w-full items-center justify-center font-serif"
    >
      <div
        class="flex h-full w-full items-center justify-center rounded bg-secondary px-8 py-4 text-primary transition-colors duration-300 dark:bg-primary dark:text-secondary md:px-12 md:py-8"
        id="error-page"
      >
        <div class="content max-w-[600px] text-center">
          <h2
            class="ani header relative mb-4 max-w-[600px] font-mono text-[120px] leading-[1em] after:absolute after:left-0 after:right-0 after:top-0 sm:text-[200px] rp:text-[18vw]"
            data-text="404"
          >
            404
          </h2>
          <h4
            class="ani mb-5 max-w-[600px] text-[20px] uppercase sm:text-[24px]"
          >
            There's nothing here...
          </h4>
          <p class="ani text-balance text-[1.2em]">
            Sorry, the page you're looking for doesn't exist. If you think
            something is broken, report a problem.
          </p>
          <div class="mt-5 flex flex-col justify-center gap-2 sm:flex-row">
            <a href="${pageContext.request.contextPath}/index.jsp">
              <button
                class="ani flex items-center rounded-sm bg-indigo-600 px-4 py-2 text-white"
              >
                <svg
                  class="size-4"
                  xmlns="http://www.w3.org/2000/svg"
                  x="0px"
                  y="0px"
                  viewBox="0,0,256,256"
                >
                  <g
                    fill="#ffffff"
                    fill-rule="nonzero"
                    stroke="none"
                    stroke-width="1"
                    stroke-linecap="butt"
                    stroke-linejoin="miter"
                    stroke-miterlimit="10"
                    stroke-dasharray=""
                    stroke-dashoffset="0"
                  >
                    <g transform="scale(10.66667,10.66667)">
                      <path
                        d="M12,2.09961l-11,9.90039h3v9h6v-7h4v7h6v-9h3z"
                      ></path>
                    </g>
                  </g>
                </svg>
                &nbsp; Home
              </button></a
            >
            <a href="https://github.com/Axyl1410/" target="_blank">
              <button
                class="ani flex items-center rounded-sm bg-red-600 px-4 py-2 text-white"
              >
                <svg
                  class="size-3 fill-white"
                  version="1.1"
                  id="Capa_1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  x="0px"
                  y="0px"
                  viewBox="0 0 47 47"
                  style="enable-background: new 0 0 47 47"
                  xml:space="preserve"
                >
                  <path
                    d="M46.923,0.618c-0.101-0.245-0.296-0.44-0.541-0.541C46.26,0.027,46.13,0,46,0H19c-0.553,0-1,0.448-1,1s0.447,1,1,1h24.586L0.293,45.293c-0.391,0.391-0.391,1.023,0,1.414C0.488,46.902,0.744,47,1,47s0.512-0.098,0.707-0.293L45,3.414V28c0,0.552,0.447,1,1,1s1-0.448,1-1V1C47,0.87,46.974,0.74,46.923,0.618z"
                  />
                </svg>

                &nbsp; Report a problem
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>
    <script>
      gsap.fromTo(
        [".ani"],
        { y: 50, opacity: 0 },
        { y: 0, opacity: 1, stagger: 0.15, duration: 1, ease: "power3.out" }
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
