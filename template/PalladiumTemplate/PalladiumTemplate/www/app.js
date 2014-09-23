document.addEventListener("deviceready", function (e) {
    var h2 = document.createElement("h2");
    h2.appendChild(document.createTextNode("Device is ready"));
                          
    document.body.appendChild(h2);
}, false);