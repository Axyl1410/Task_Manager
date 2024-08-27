<button
  class="group fixed bottom-5 right-5 z-30 rounded-full border border-black bg-black p-2 opacity-0 shadow-md transition-all duration-300 hover:bg-white"
  onclick="window.scrollTo({ top: 0, behavior: 'smooth' })"
  id="backToTop"
>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    fill="none"
    viewBox="0 0 24 24"
    strokeWidth="1.5"
    class="h-6 w-6 stroke-white group-hover:stroke-black"
  >
    <path
      strokeLinecap="round"
      strokeLinejoin="round"
      d="M4.5 15.75l7.5-7.5 7.5 7.5"
    />
  </svg>
</button>
<script>
  window.addEventListener("scroll", function () {
    const backToTop = document.getElementById("backToTop");
    if (window.scrollY > 100) {
      backToTop.classList.remove("opacity-0");
      backToTop.classList.add("opacity-1");
    } else {
      backToTop.classList.remove("opacity-1");
      backToTop.classList.add("opacity-0");
    }
  });
</script>