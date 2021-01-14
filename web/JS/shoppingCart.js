// Remove Items From Cart
$("a.remove").click(function () {
  event.preventDefault();
  $(this).parent().parent().parent().hide(400);
});

// Just for testing, show all items
$("a.btn.continue").click(function () {
  $("li.items").show(400);
});

var formcb = document.getElementByClassName("formCB");
formcb.forEach((e) => {
  e.onsubmit = () => {
    return false;
  };
});
var listCB = document.querySelectorAll("#formCB .CB ");
listCB.forEach((CB) => {
  CB.onclick = () => {
    CB.parentElement.onsubmit = () => {
      return true;
    };
  };
});
