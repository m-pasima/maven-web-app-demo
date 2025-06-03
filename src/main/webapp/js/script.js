document.addEventListener('DOMContentLoaded', function() {
  var btn = document.getElementById('colorBtn');
  var message = document.getElementById('message');
  if (!btn || !message) return;
  var original = message.textContent;
  var toggled = false;
  btn.addEventListener('click', function() {
    toggled = !toggled;
    document.body.classList.toggle('alt-theme');
    message.textContent = toggled ? 'Have a great DevOps day!' : original;
  });
});
