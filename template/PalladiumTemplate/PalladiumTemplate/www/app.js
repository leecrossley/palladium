/*global palladium*/

document.addEventListener("deviceready", function () {
    "use strict";

    var h2 = document.createElement("h2");
    h2.appendChild(document.createTextNode("Device is ready"));
    document.body.appendChild(h2);

    palladium.plugin("Alert", "alert", "Device is ready");

}, false);
