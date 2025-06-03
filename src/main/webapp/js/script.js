// Countdown timer to March 10, 2025
var countDownDate = new Date("Mar 10, 2025 00:00:00").getTime();
var sideCountdown = setInterval(function() {
  var now = new Date().getTime();
  var distance = countDownDate - now;
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  document.getElementById("days-side").innerHTML = days < 10 ? "0" + days : days;
  document.getElementById("hours-side").innerHTML = hours < 10 ? "0" + hours : hours;
  document.getElementById("minutes-side").innerHTML = minutes < 10 ? "0" + minutes : minutes;
  document.getElementById("seconds-side").innerHTML = seconds < 10 ? "0" + seconds : seconds;
  if (distance < 0) {
    clearInterval(sideCountdown);
    document.querySelector(".timer-side-box").innerHTML = "<p style='font-size:2.5rem; color:#ff0000;'>The program has started!</p>";
  }
}, 1000);

// Accordion functionality
var accordionHeaders = document.querySelectorAll('.accordion-header');
accordionHeaders.forEach(function(header) {
  header.addEventListener('click', function() {
    var accordionContent = header.nextElementSibling;
    var symbol = header.querySelector('.symbol');
    if (accordionContent.classList.contains('open')) {
      accordionContent.style.maxHeight = 0;
      accordionContent.classList.remove('open');
      symbol.textContent = '+';
    } else {
      document.querySelectorAll('.accordion-content.open').forEach(function(openItem) {
        openItem.style.maxHeight = 0;
        openItem.classList.remove('open');
        openItem.previousElementSibling.querySelector('.symbol').textContent = '+';
      });
      accordionContent.classList.add('open');
      accordionContent.style.maxHeight = accordionContent.scrollHeight + 'px';
      symbol.textContent = '−';
    }
  });
});
