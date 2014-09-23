/*global webkit*/

var palladium = (function () {
    "use strict";

    var palladium = {};

    palladium.alert = function (message) {
        webkit.messageHandlers.callbackHandler.postMessage(message);
    };

    return palladium;
}());
