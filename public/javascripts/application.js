"use strict";

if (window.XMLHttpRequest) {
  document.getElementById("directions-input")
  .addEventListener("submit", function(event) {
    event.preventDefault();

    var url     = event.target.action;
    var method  = event.target.method;
    var params  = "?query=" + event.target.firstElementChild.value;
    var request = new XMLHttpRequest();

    request.onreadystatechange = function () {
      if (request.readyState == 4 && request.status == 200)
        console.log(request.responseText);
    };

    request.open(method, url + params, true);
    request.send();
  });
}
