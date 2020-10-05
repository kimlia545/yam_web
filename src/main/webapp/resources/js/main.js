
const toggleBtn = document.querySelector(".navbar__toggleBtn");
const menu = document.querySelector(".navbar__menu");
const member = document.querySelector(".navbar__member");
const icons = document.querySelector(".navbar__icons");
const articles = document.querySelector(".write-new");

 
toggleBtn.addEventListener("click", () => {
  menu.classList.toggle("active");
  member.classList.toggle("active");
  icons.classList.toggle("active");
  articles.classList.toggle("active");
});